import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/core/crypto/crypto.dart';
import 'package:frontend/core/session/crypto_session.dart';
import 'package:frontend/features/notes/domain/mappers/notes_mapper.dart';
import 'package:frontend/features/notes/domain/note.dart';
import 'package:frontend/features/notes/domain/notes_repository.dart';
import 'package:frontend/features/notes/domain/notes_service.dart';

class SecureNotesService implements NotesService {
  SecureNotesService({
    required EncryptionService encryption,
    required CryptoSession cryptoSession,
    required NotesRepository repository,
  }) : _encryption = encryption,
       _cryptoSession = cryptoSession,
       _repository = repository;

  final EncryptionService _encryption;
  final CryptoSession _cryptoSession;
  final NotesRepository _repository;

  @override
  Future<void> saveNote(Note note) async {
    final masterKey = _cryptoSession.masterKey;

    final plainContent = jsonEncode(note.content.toDelta().toJson());

    final encryptedTitle = await _encryption.encryptString(
      note.title,
      masterKey,
    );
    final encryptedContent = await _encryption.encryptString(
      plainContent,
      masterKey,
    );

    final encryptedNote = note.toEncryped(
      encryptedTitle: encryptedTitle,
      encryptedContent: encryptedContent,
    );

    await _repository.saveNote(encryptedNote);
  }

  @override
  Future<Note?> loadNote(String id) async {
    final masterKey = _cryptoSession.masterKey;

    final encryptedNote = await _repository.getNoteById(id);

    if (encryptedNote == null) {
      return null;
    }

    final title = await _encryption.decryptString(
      encryptedNote.encryptedTitle,
      masterKey,
    );
    final plainContent = await _encryption.decryptString(
      encryptedNote.encryptedContent,
      masterKey,
    );

    final content = Document.fromJson(
      jsonDecode(plainContent) as List<dynamic>,
    );

    final note = encryptedNote.toNote(title: title, content: content);

    return note;
  }
}
