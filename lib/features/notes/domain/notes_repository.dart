import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/notes/domain/encrypted_note.dart';
import 'package:frontend/features/notes/domain/notes_failure.dart';

abstract class NotesRepository {
  Future<Result<void, NotesFailure>> saveNote(EncryptedNote note);
  Future<Result<EncryptedNote?, NotesFailure>> getNoteById(String id);
}
