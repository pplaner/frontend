import 'package:frontend/core/domain/result.dart';
import 'package:frontend/core/utils/data_source_runner.dart';
import 'package:frontend/features/notes/data/mappers/encrypted_note_local_mapper.dart';
import 'package:frontend/features/notes/data/sources/notes_local_data_source.dart';
import 'package:frontend/features/notes/domain/entities/encrypted_note.dart';
import 'package:frontend/features/notes/domain/failures/notes_failure.dart';
import 'package:frontend/features/notes/domain/notes_repository.dart';

class UnifiedNotesRepository with DataSourceRunner implements NotesRepository {
  UnifiedNotesRepository({required NotesLocalDataSource local})
    : _local = local;

  final NotesLocalDataSource _local;

  @override
  Future<Result<void, NotesFailure>> saveNote(EncryptedNote note) async {
    return localRunner(
      call: () => _local.saveNote(note.toCompanion()),
      mapCore: NotesFailure.core,
    );
  }

  @override
  Future<Result<EncryptedNote?, NotesFailure>> getNoteById(String id) async {
    final result = await localRunner(
      call: () => _local.getNoteById(id),
      mapCore: NotesFailure.core,
    );

    return result.map((model) => model?.toDomain());
  }
}
