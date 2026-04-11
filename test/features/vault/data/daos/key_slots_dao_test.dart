import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/vault/data/daos/key_slots_dao.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

import '../../../../fixtures/vault_fixtures.dart';

void main() {
  late AppDatabase db;
  late KeySlotsDao dao;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = db.keySlotsDao;
  });

  tearDown(() async {
    await db.close();
  });

  group('KeySlotsDao', () {
    final testSlot = VaultFixtures.validPinSlot;

    test('getKeySlotByType return null when db is empty', () async {
      final result = await dao.getKeySlotByType(KeyType.pin);
      expect(result, isNull);
    });

    test('saveKeySlot saves the slot which can be retrieved', () async {
      await dao.saveKeySlot(testSlot);
      final result = await dao.getKeySlotByType(testSlot.type);

      expect(result, isNotNull);
      expect(result!.type, equals(testSlot.type));
      expect(result.salt, equals(testSlot.salt));
    });

    test('saveKeySlot replaces existing slot', () async {
      await dao.saveKeySlot(testSlot);

      final updatedSlot = VaultFixtures.emptyPinSlot;
      await dao.saveKeySlot(updatedSlot);

      final allSlots = await dao.getAllKeySlots();
      expect(allSlots.length, 1);

      final result = await dao.getKeySlotByType(KeyType.pin);
      expect(result!.salt, equals(updatedSlot.salt));
    });
  });
}
