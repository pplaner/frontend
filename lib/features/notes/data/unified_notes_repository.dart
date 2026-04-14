import 'package:frontend/features/notes/data/mappers/encrypted_note_local_mapper.dart';
import 'package:frontend/features/notes/data/sources/notes_local_data_source.dart';
import 'package:frontend/features/notes/domain/encrypted_note.dart';
import 'package:frontend/features/notes/domain/notes_repository.dart';

class UnifiedNotesRepository implements NotesRepository {
  UnifiedNotesRepository({required NotesLocalDataSource local})
    : _local = local;

  final NotesLocalDataSource _local;

  @override
  Future<void> saveNote(EncryptedNote note) async {
    final companion = note.toCompanion();

    await _local.saveNote(companion);
  }

  @override
  Future<EncryptedNote?> getNoteById(String id) async {
    final model = await _local.getNoteById(id);

    return model?.toDomain();
  }
}
