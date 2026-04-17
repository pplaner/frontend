import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/notes/domain/note.dart';
import 'package:frontend/features/notes/domain/notes_failure.dart';

abstract class NotesService {
  Future<Result<void, NotesFailure>> saveNote(Note note);
  Future<Result<Note?, NotesFailure>> loadNote(String id);
}
