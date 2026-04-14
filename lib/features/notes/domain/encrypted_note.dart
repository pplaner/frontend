import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/notes/domain/sync_status.dart';

part 'encrypted_note.freezed.dart';

@freezed
sealed class EncryptedNote with _$EncryptedNote {
  const factory EncryptedNote({
    required String id,

    required Uint8List encryptedTitle,
    required Uint8List encryptedContent,

    required int localVersion,
    required int lastSyncedVersion,
    required SyncStatus syncStatus,

    required DateTime createdAt,
    required DateTime updatedAt,

    String? folderId,
  }) = _EncryptedNote;

  const EncryptedNote._();
}
