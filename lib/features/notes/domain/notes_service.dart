import 'package:frontend/features/notes/domain/note.dart';

abstract class NotesService {
  Future<void> saveNote(Note note);
  Future<Note?> loadNote(String id);
}
