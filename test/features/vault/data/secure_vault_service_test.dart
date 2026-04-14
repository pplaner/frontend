import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/crypto/crypto.dart';
import 'package:frontend/features/vault/data/secure_vault_service.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_failure.dart';
import 'package:frontend/features/vault/domain/vault_repository.dart';
import 'package:frontend/features/vault/domain/vault_service.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/vault_fixtures.dart';
import '../../../helpers/test_helpers.dart';

class MockRandomService extends Mock implements RandomService {}

class MockDerivationService extends Mock implements DerivationService {}

class MockEncryptionService extends Mock implements EncryptionService {}

class MockVaultRepository extends Mock implements VaultRepository {}

void main() {
  setUpAll(() {
    Logger.level = Level.off;
    registerTestFallbacks();
  });

  late MockRandomService mockRandom;
  late MockDerivationService mockDerivation;
  late MockEncryptionService mockEncryption;
  late MockVaultRepository mockRepo;
  late VaultService service;

  setUp(() {
    mockRandom = MockRandomService();
    mockDerivation = MockDerivationService();
    mockEncryption = MockEncryptionService();
    mockRepo = MockVaultRepository();

    service = SecureVaultService(
      random: mockRandom,
      derivation: mockDerivation,
      encryption: mockEncryption,
      repository: mockRepo,
    );
  });

  final masterKey = VaultFixtures.validMasterKey;
  final salt = VaultFixtures.validSalt;
  final kek = VaultFixtures.validKek;
  final wmk = VaultFixtures.validWmk;

  final pinSlot = VaultFixtures.validPinSlot;

  group('SecureVaultService - intializeNewVault', () {
    test(
      'generates one slot when only one secret is provided',
      () async {
        when(() => mockRandom.generateBytes(32)).thenReturn(masterKey);
        when(() => mockRandom.generateBytes(16)).thenReturn(salt);
        when(
          () => mockDerivation.derive(any(), salt),
        ).thenAnswer((_) async => kek);
        when(
          () => mockEncryption.encrypt(masterKey, kek),
        ).thenAnswer((_) async => wmk);
        when(() => mockRepo.saveKeySlot(any())).thenAnswer((_) async {});

        const secrets = {KeyType.pin: '1234'};
        await service.intializeNewVault(secrets);

        verify(() => mockRandom.generateBytes(32)).called(1);
        verify(() => mockRandom.generateBytes(16)).called(1);
        verify(
          () => mockDerivation.derive(any(), salt),
        ).called(1);
        verify(() => mockEncryption.encrypt(masterKey, kek)).called(1);
        verify(() => mockRepo.saveKeySlot(any())).called(1);
      },
    );

    test(
      'generates several slots when multiple secrets are provided',
      () async {
        when(() => mockRandom.generateBytes(32)).thenReturn(masterKey);
        when(() => mockRandom.generateBytes(16)).thenReturn(salt);
        when(
          () => mockDerivation.derive(any(), salt),
        ).thenAnswer((_) async => kek);
        when(
          () => mockEncryption.encrypt(masterKey, kek),
        ).thenAnswer((_) async => wmk);
        when(() => mockRepo.saveKeySlot(any())).thenAnswer((_) async {});

        const secrets = {KeyType.pin: '1234', KeyType.graph: '4321'};
        await service.intializeNewVault(secrets);

        verify(() => mockRandom.generateBytes(32)).called(1);
        verify(() => mockRandom.generateBytes(16)).called(2);
        verify(
          () => mockDerivation.derive(any(), salt),
        ).called(2);
        verify(() => mockEncryption.encrypt(masterKey, kek)).called(2);
        verify(() => mockRepo.saveKeySlot(any())).called(2);
      },
    );
  });

  group('SecureVaultService - unlock', () {
    test(
      'throws VaultNotInitializedException if given slot is found',
      () async {
        when(
          () => mockRepo.getKeySlotByType(KeyType.pin),
        ).thenAnswer((_) async => null);

        expect(
          () => service.unlock(KeyType.pin, '1234'),
          throwsA(isA<VaultNotInitializedException>()),
        );
      },
    );

    test('returns decrypted master key when secret is correct', () async {
      when(
        () => mockRepo.getKeySlotByType(KeyType.pin),
      ).thenAnswer((_) async => pinSlot);
      when(
        () => mockDerivation.derive(any(), salt),
      ).thenAnswer((_) async => kek);
      when(
        () => mockEncryption.decrypt(wmk, kek),
      ).thenAnswer((_) async => masterKey);

      final result = await service.unlock(KeyType.pin, '1234');

      expect(result, equals(masterKey));
    });

    test('throws InvalidPinException if derivation fails', () async {
      when(
        () => mockRepo.getKeySlotByType(KeyType.pin),
      ).thenAnswer((_) async => pinSlot);
      when(
        () => mockDerivation.derive(any(), any()),
      ).thenThrow(Exception('Compute failed'));

      expect(
        () => service.unlock(KeyType.pin, 'bad_pin'),
        throwsA(isA<InvalidPinException>()),
      );
    });

    test(
      'throws InvalidPinException if decryption (MAC check) fails',
      () async {
        when(
          () => mockRepo.getKeySlotByType(KeyType.pin),
        ).thenAnswer((_) async => pinSlot);
        when(
          () => mockDerivation.derive(any(), any()),
        ).thenAnswer((_) async => kek);
        when(
          () => mockEncryption.decrypt(any(), any()),
        ).thenThrow(Exception('MAC check failed'));

        expect(
          () => service.unlock(KeyType.pin, 'bad_pin'),
          throwsA(isA<InvalidPinException>()),
        );
      },
    );
  });
}
