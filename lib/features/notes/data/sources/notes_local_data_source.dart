import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/notes/data/daos/notes_dao.dart';

class NotesLocalDataSource {
  NotesLocalDataSource({required NotesDao notesDao}) : _notesDao = notesDao;

  final NotesDao _notesDao;

  Future<void> saveNote(NotesCompanion note) => _notesDao.saveNote(note);

  Future<NoteModel?> getNoteById(String id) => _notesDao.getNoteById(id);
}
