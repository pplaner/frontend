import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

part 'key_slot.freezed.dart';

@freezed
sealed class KeySlot with _$KeySlot {
  const factory KeySlot({
    required KeyType type,
    required Uint8List salt,
    required Uint8List wrappedMasterKey,
  }) = _KeySlot;
}
