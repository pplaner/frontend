import 'dart:async';

import 'package:frontend/core/storage/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();

  ref.onDispose(() {
    unawaited(db.close());
  });

  return db;
}
