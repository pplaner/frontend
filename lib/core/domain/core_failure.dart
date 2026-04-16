import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_failure.freezed.dart';

@freezed
sealed class CoreFailure with _$CoreFailure {
  const factory CoreFailure.network() = _Network;
  const factory CoreFailure.storage(String message) = _Storage;
  const factory CoreFailure.crypto(String message) = _Crypto;
  const factory CoreFailure.unexpected(Object e) = _Unexpected;
}
