import 'dart:async';

import 'package:frontend/core/session/session_manager.dart';
import 'package:frontend/features/vault/data/secure_vault_service.dart';
import 'package:frontend/features/vault/domain/entities/key_type.dart';
import 'package:frontend/features/vault/domain/vault_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vault_notifier.g.dart';

@riverpod
class VaultNotifier extends _$VaultNotifier {
  @override
  VaultState build() {
    unawaited(_checkIntitalizationState());
    return const VaultInitializing();
  }

  Future<void> initializeWithPin(String pin) async {
    await _intializeVault(KeyType.pin, pin);
  }

  Future<void> unlockWithPin(String pin) async {
    await _performUnlock(KeyType.pin, pin);
  }

  void lockVault() {
    ref.read(sessionControllerProvider).clearSession();
    state = const VaultLocked();
  }

  Future<void> _checkIntitalizationState() async {
    final vaultService = ref.read(vaultServiceProvider);

    final result = await vaultService.isInitialized();

    state = result.fold(
      (success) => success ? const VaultLocked() : const VaultNotInitialized(),
      VaultError.new,
    );
  }

  Future<void> _performUnlock(KeyType type, String secret) async {
    final vaultService = ref.read(vaultServiceProvider);

    final result = await vaultService.unlock(type, secret);

    state = result.fold(
      (success) => const VaultUnlocked(),
      VaultError.new,
    );
  }

  Future<void> _intializeVault(KeyType type, String secret) async {
    final vaultService = ref.read(vaultServiceProvider);

    final result = await vaultService.intializeNewVault({type: secret});

    state = result.fold(
      (success) => const VaultUnlocked(),
      VaultError.new,
    );
  }
}
