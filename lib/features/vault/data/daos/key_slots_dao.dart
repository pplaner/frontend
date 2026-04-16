import 'package:drift/drift.dart';
import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/vault/data/tables/key_slots.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

part 'key_slots_dao.g.dart';

@DriftAccessor(tables: [KeySlots])
class KeySlotsDao extends DatabaseAccessor<AppDatabase>
    with _$KeySlotsDaoMixin {
  KeySlotsDao(super.attachedDatabase);

  Future<void> saveKeySlot(KeySlot slot) =>
      into(keySlots).insert(slot, mode: InsertMode.insertOrReplace);

  Future<void> saveKeySlots(List<KeySlot> slots) => batch((batch) {
    batch.insertAll(keySlots, slots);
  });

  Future<List<KeySlot>> getAllKeySlots() => select(keySlots).get();

  Future<KeySlot?> getKeySlotByType(KeyType type) => (select(
    keySlots,
  )..where((tbl) => tbl.type.equals(type.index))).getSingleOrNull();

  Future<void> deleteKeySlot(KeyType type) => (delete(
    keySlots,
  )..where((tbl) => tbl.type.equals(type.index))).go();
}
