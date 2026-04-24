import 'package:frontend/core/domain/core_failure.dart';
import 'package:frontend/features/notes/domain/failures/notes_failure.dart';

extension NotesFailureToCore on NotesFailure {
  CoreFailure toCore() {
    return switch (this) {
      _ => CoreFailure.unexpected(
        Exception(
          'Unexpected failure when mapping from NotesFailure to CoreFailure',
        ),
      ),
    };
  }
}
