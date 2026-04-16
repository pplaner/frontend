import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/domain/core_failure.dart';

part 'vault_failure.freezed.dart';

@freezed
sealed class VaultFailure with _$VaultFailure {
  const factory VaultFailure.vaultLocked() = _VaultLocked;
  const factory VaultFailure.vaultNotInitialized() = _VaultNotInitialized;
  const factory VaultFailure.invalidSecret() = _InvalidSecret;

  const factory VaultFailure.core(CoreFailure core) = _VaultCore;
}
