import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/notes/domain/sync_status.dart';

part 'note.freezed.dart';

@freezed
sealed class Note with _$Note {
  const factory Note({
    required String id,

    required String title,
    required Document content,

    required int localVersion,
    required int lastSyncedVersion,
    required SyncStatus syncStatus,

    required DateTime createdAt,
    required DateTime updatedAt,

    String? folderId,
  }) = _Note;

  const Note._();

  bool get isSynced => syncStatus == SyncStatus.synced;
}
