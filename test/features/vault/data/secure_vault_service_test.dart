import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/crypto/crypto.dart';
import 'package:frontend/core/session/session_controller.dart';
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

class MockSessionController extends Mock implements SessionController {}

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
  late MockSessionController mockSessionController;
  late VaultService service;

  setUp(() {
    mockRandom = MockRandomService();
    mockDerivation = MockDerivationService();
    mockEncryption = MockEncryptionService();
    mockSessionController = MockSessionController();
    mockRepo = MockVaultRepository();

    service = SecureVaultService(
      random: mockRandom,
      derivation: mockDerivation,
      encryption: mockEncryption,
      sessionController: mockSessionController,
      repository: mockRepo,
    );
  });

  final masterKey = VaultFixtures.validMasterKey;

  final pinSlot = VaultFixtures.validPinSlot;

  group('SecureVaultService - intializeNewVault', () {
    test(
      'saves all provided secrets to repository and sets session mk',
      () async {
        when(() => mockRandom.generateBytes(any())).thenReturn(masterKey);
        when(
          () => mockDerivation.derive(any(), any()),
        ).thenAnswer((_) async => masterKey);
        when(
          () => mockEncryption.encrypt(any(), any()),
        ).thenAnswer((_) async => masterKey);
        when(() => mockSessionController.setMasterKey(any())).thenReturn(null);
        when(() => mockRepo.saveKeySlot(any())).thenAnswer((_) async {});

        const secrets = {KeyType.pin: '1234', KeyType.graph: '4321'};
        await service.intializeNewVault(secrets);

        verify(() => mockRepo.saveKeySlot(any())).called(2);
        verify(() => mockSessionController.setMasterKey(masterKey)).called(1);
      },
    );
  });

  group('SecureVaultService - unlock', () {
    test(
      'throws VaultNotInitializedException if given slot is not found',
      () async {
        when(
          () => mockRepo.getKeySlotByType(KeyType.pin),
        ).thenAnswer((_) async => null);

        expect(
          () => service.unlock(KeyType.pin, '1234'),
          throwsA(isA<VaultNotInitializedException>()),
        );

        verifyNever(() => mockSessionController.setMasterKey(any()));
      },
    );

    test(
      'sets decrypted master key in session when secret is correct',
      () async {
        when(
          () => mockRepo.getKeySlotByType(KeyType.pin),
        ).thenAnswer((_) async => pinSlot);
        when(
          () => mockDerivation.derive(any(), any()),
        ).thenAnswer((_) async => masterKey);
        when(
          () => mockEncryption.decrypt(any(), any()),
        ).thenAnswer((_) async => masterKey);

        await service.unlock(KeyType.pin, '1234');

        verify(() => mockSessionController.setMasterKey(masterKey)).called(1);
      },
    );

    test(
      'throws InvalidPinException if decryption (MAC check) fails',
      () async {
        when(
          () => mockRepo.getKeySlotByType(KeyType.pin),
        ).thenAnswer((_) async => pinSlot);
        when(
          () => mockDerivation.derive(any(), any()),
        ).thenAnswer((_) async => masterKey);
        when(
          () => mockEncryption.decrypt(any(), any()),
        ).thenThrow(Exception('MAC check failed'));

        expect(
          () => service.unlock(KeyType.pin, 'bad_pin'),
          throwsA(isA<InvalidPinException>()),
        );

        verifyNever(() => mockSessionController.setMasterKey(any()));
      },
    );
  });
}
