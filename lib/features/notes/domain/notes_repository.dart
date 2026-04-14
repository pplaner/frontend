import 'package:frontend/features/notes/domain/encrypted_note.dart';

abstract class NotesRepository {
  Future<void> saveNote(EncryptedNote note);
  Future<EncryptedNote?> getNoteById(String id);
}
