import 'package:drift/drift.dart';
import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/notes/data/tables/folders.dart';

part 'folders_dao.g.dart';

@DriftAccessor(tables: [Folders])
class FoldersDao extends DatabaseAccessor<AppDatabase> with _$FoldersDaoMixin {
  FoldersDao(super.attachedDatabase);

  Future<void> saveFolder(FolderModel folder) =>
      into(folders).insert(folder, mode: InsertMode.insertOrReplace);
}
