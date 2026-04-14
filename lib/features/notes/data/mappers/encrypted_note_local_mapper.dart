import 'package:drift/drift.dart';
import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/notes/domain/encrypted_note.dart';

extension NoteModelToEncrypted on NoteModel {
  EncryptedNote toDomain() => EncryptedNote(
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

extension EncryptedToNotesCompanion on EncryptedNote {
  NotesCompanion toCompanion() => NotesCompanion.insert(
    id: id,
    encryptedTitle: encryptedTitle,
    encryptedContent: encryptedContent,

    localVersion: Value(localVersion),
    lastSyncedVersion: Value(lastSyncedVersion),
    syncStatus: Value(syncStatus),

    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),

    folderId: Value(folderId),
  );
}
