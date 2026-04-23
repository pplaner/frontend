import 'dart:typed_data';

import 'package:frontend/features/notes/domain/entities/encrypted_project.dart';
import 'package:frontend/features/notes/domain/entities/project.dart';

extension ProjectToEncrypted on Project {
  EncryptedProject toEncrypted({
    required Uint8List encryptedContent,
  }) => EncryptedProject(
    id: id,

    encryptedContent: encryptedContent,

    localVersion: localVersion,
    lastSyncedVersion: lastSyncedVersion,
    syncStatus: syncStatus,

    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}

extension EncryptedToProject on EncryptedProject {
  Project toProject({required String content}) => Project(
    id: id,

    content: content,

    localVersion: localVersion,
    lastSyncedVersion: lastSyncedVersion,
    syncStatus: syncStatus,

    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
