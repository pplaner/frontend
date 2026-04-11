import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/vault/data/data_sources/vault_local_data_source.dart';
import 'package:frontend/features/vault/data/vault_repository_impl.dart';
import 'package:frontend/features/vault/domain/vault_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/vault_fixtures.dart';
import '../../../helpers/test_helpers.dart';

class MockVaultLocalDataSource extends Mock implements VaultLocalDataSource {}

void main() {
  setUpAll(registerTestFallbacks);

  late MockVaultLocalDataSource mockLocal;
  late VaultRepository repository;

  setUp(() {
    mockLocal = MockVaultLocalDataSource();
    repository = VaultRepositoryImpl(local: mockLocal);
  });

  group('VaultRepository', () {
    test('saveKeySlot calls all necessary data sources', () async {
      when(() => mockLocal.saveKeySlot(any())).thenAnswer((_) async {});

      final slot = VaultFixtures.emptyPinSlot;

      await repository.saveKeySlot(slot);

      verify(() => mockLocal.saveKeySlot(slot)).called(1);
    });

    test('getKeySlotByType calls correct data sources', () async {
      final slot = VaultFixtures.emptyPinSlot;
      when(() => mockLocal.getKeySlotByType(any())).thenAnswer((_) async {
        return slot;
      });

      await repository.getKeySlotByType(slot.type);

      verify(() => mockLocal.getKeySlotByType(slot.type)).called(1);
    });
  });
}
