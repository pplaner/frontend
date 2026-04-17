import 'dart:typed_data';

import 'package:frontend/features/vault/domain/entities/key_slot.dart';
import 'package:frontend/features/vault/domain/entities/key_type.dart';

class VaultFixtures {
  static Uint8List get emptyMasterKey => Uint8List(0);
  static Uint8List get validMasterKey => Uint8List.fromList(List.filled(32, 1));

  static Uint8List get emptySalt => Uint8List(0);
  static Uint8List get validSalt => Uint8List.fromList(List.filled(16, 2));

  static Uint8List get emptyKek => Uint8List(0);
  static Uint8List get validKek => Uint8List.fromList(List.filled(32, 3));

  static Uint8List get emptyWmk => Uint8List(0);
  static Uint8List get validWmk => Uint8List.fromList(List.filled(32, 4));

  static KeySlot get emptyPinSlot => KeySlot(
    type: KeyType.pin,
    salt: emptySalt,
    wrappedMasterKey: emptyWmk,
  );

  static KeySlot get validPinSlot => KeySlot(
    type: KeyType.pin,
    salt: validSalt,
    wrappedMasterKey: validWmk,
  );

  static KeySlot get emptyGraphSlot => KeySlot(
    type: KeyType.graph,
    salt: emptySalt,
    wrappedMasterKey: emptyWmk,
  );
}
