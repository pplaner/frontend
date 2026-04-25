import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/notes/domain/entities/note.dart';
import 'package:frontend/features/notes/domain/failures/notes_failure.dart';

abstract class NotesService {
  Future<Result<void, NotesFailure>> saveNote(Note note);
  Future<Result<Note?, NotesFailure>> getNote(String id);
}
