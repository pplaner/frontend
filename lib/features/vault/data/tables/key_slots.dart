import 'package:drift/drift.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

@DataClassName('KeySlotModel')
class KeySlots extends Table {
  IntColumn get type => intEnum<KeyType>()();
  BlobColumn get salt => blob()();
  BlobColumn get wrappedMasterKey => blob()();

  @override
  Set<Column> get primaryKey => {type};
}
