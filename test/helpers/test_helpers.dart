import 'dart:typed_data';

import 'package:frontend/features/vault/data/mappers/key_slot_local_mapper.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/vault_fixtures.dart';

void registerTestFallbacks() {
  registerFallbackValue(KeyType.pin);
  registerFallbackValue(Uint8List(0));
  registerFallbackValue(VaultFixtures.emptyPinSlot);
  registerFallbackValue(VaultFixtures.emptyPinSlot.toCompanion());
}
