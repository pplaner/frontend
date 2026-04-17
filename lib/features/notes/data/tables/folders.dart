import 'package:drift/drift.dart';
import 'package:frontend/features/notes/domain/entities/sync_status.dart';

@DataClassName('FolderModel')
class Folders extends Table {
  TextColumn get id => text()();
  BlobColumn get encryptedContent => blob()();

  IntColumn get localVersion => integer().withDefault(const Constant(1))();
  IntColumn get lastSyncedVersion => integer().withDefault(const Constant(0))();
  IntColumn get state => intEnum<SyncStatus>().withDefault(const Constant(1))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
