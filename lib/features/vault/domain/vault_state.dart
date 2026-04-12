import 'package:flutter/services.dart';

sealed class VaultState {
  const VaultState();

  const factory VaultState.locked() = VaultLocked;
  const factory VaultState.unlocked({required Uint8List masterKey}) =
      VaultUnlocked;
  const factory VaultState.error(String message) = VaultError;
}

class VaultLocked extends VaultState {
  const VaultLocked();
}

class VaultUnlocked extends VaultState {
  const VaultUnlocked({required this.masterKey});

  final Uint8List masterKey;
}

class VaultError extends VaultState {
  const VaultError(this.message);

  final String message;
}
