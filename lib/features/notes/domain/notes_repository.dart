import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/notes/domain/entities/encrypted_note.dart';
import 'package:frontend/features/notes/domain/failures/notes_failure.dart';

abstract class NotesRepository {
  Future<Result<void, NotesFailure>> saveNote(EncryptedNote note);
  Future<Result<EncryptedNote?, NotesFailure>> getNote(String id);
}
