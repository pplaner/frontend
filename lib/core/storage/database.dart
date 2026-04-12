import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// Only tables and daos are allowed to be imported from features
import 'package:frontend/features/vault/data/daos/key_slots_dao.dart';
import 'package:frontend/features/vault/data/tables/key_slots.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // TO-DO: change to getApplicationSupportDirectory later
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [KeySlots], daos: [KeySlotsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {},
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
