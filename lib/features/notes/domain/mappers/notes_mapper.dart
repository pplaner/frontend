import 'dart:typed_data';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/features/notes/domain/encrypted_note.dart';
import 'package:frontend/features/notes/domain/note.dart';

extension NoteToEncrypted on Note {
  EncryptedNote toEncryped({
    required Uint8List encryptedTitle,
    required Uint8List encryptedContent,
  }) => EncryptedNote(
    id: id,
    encryptedTitle: encryptedTitle,
    encryptedContent: encryptedContent,

    localVersion: localVersion,
    lastSyncedVersion: lastSyncedVersion,
    syncStatus: syncStatus,

    createdAt: createdAt,
    updatedAt: updatedAt,

    folderId: folderId,
  );
}

extension EncryptedToNote on EncryptedNote {
  Note toNote({required String title, required Document content}) => Note(
    id: id,
    title: title,
    content: content,

    localVersion: localVersion,
    lastSyncedVersion: lastSyncedVersion,
    syncStatus: syncStatus,

    createdAt: createdAt,
    updatedAt: updatedAt,

    folderId: folderId,
  );
}
