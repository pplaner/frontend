import 'dart:typed_data';

import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/vault/domain/entities/key_type.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/vault_fixtures.dart';

void registerTestFallbacks() {
  registerFallbackValue(KeyType.pin);
  registerFallbackValue(Uint8List(0));
  registerFallbackValue(VaultFixtures.buildKeySlot());
  registerFallbackValue(const KeySlotsCompanion());
  registerFallbackValue(const NotesCompanion());
  registerFallbackValue(const ProjectsCompanion());
  registerFallbackValue(const NoteConflictsCompanion());
}
