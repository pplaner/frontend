import 'dart:typed_data';

import 'package:frontend/core/storage/database.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:mocktail/mocktail.dart';

class FakeKeySlot extends Fake implements KeySlot {}

void registerTestFallbacks() {
  registerFallbackValue(KeyType.pin);
  registerFallbackValue(FakeKeySlot());
  registerFallbackValue(Uint8List(0));
}
