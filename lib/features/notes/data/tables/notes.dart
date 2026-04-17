import 'package:drift/drift.dart';
import 'package:frontend/features/notes/data/tables/folders.dart';
import 'package:frontend/features/notes/domain/entities/sync_status.dart';

@DataClassName('NoteModel')
class Notes extends Table {
  TextColumn get id => text()();
  BlobColumn get encryptedTitle => blob()();
  BlobColumn get encryptedContent => blob()();

  IntColumn get localVersion => integer().withDefault(const Constant(1))();
  IntColumn get lastSyncedVersion => integer().withDefault(const Constant(0))();
  IntColumn get syncStatus =>
      intEnum<SyncStatus>().withDefault(const Constant(1))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  TextColumn get folderId => text().nullable().references(
    Folders,
    #id,
    onDelete: KeyAction.setNull,
    onUpdate: KeyAction.cascade,
  )();

  @override
  Set<Column> get primaryKey => {id};
}
