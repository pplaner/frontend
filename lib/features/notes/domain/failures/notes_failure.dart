import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/domain/core_failure.dart';

part 'notes_failure.freezed.dart';

@freezed
sealed class NotesFailure with _$NotesFailure {
  const factory NotesFailure.idNotFound() = _IdNotFound;
  const factory NotesFailure.sessionLocked() = _SessionLocked;

  const factory NotesFailure.core(CoreFailure core) = _NotesCore;
}
