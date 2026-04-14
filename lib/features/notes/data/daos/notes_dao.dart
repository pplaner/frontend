import 'package:drift/drift.dart';
import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/notes/data/tables/notes.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.attachedDatabase);

  Future<void> saveNote(NotesCompanion note) =>
      into(notes).insert(note, mode: InsertMode.insertOrReplace);

  Future<NoteModel?> getNoteById(String id) =>
      (select(notes)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
}
