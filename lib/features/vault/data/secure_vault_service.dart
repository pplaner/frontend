import 'package:frontend/app/database/database.dart';
import 'package:frontend/core/crypto/crypto.dart';
import 'package:frontend/core/session/session_controller.dart';
import 'package:frontend/core/session/session_manager.dart';
import 'package:frontend/core/utils/logger.dart';
import 'package:frontend/features/vault/data/vault_repository_impl.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_failure.dart';
import 'package:frontend/features/vault/domain/vault_repository.dart';
import 'package:frontend/features/vault/domain/vault_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SecureVaultService implements VaultService {
  SecureVaultService({
    required RandomService random,
    required DerivationService derivation,
    required EncryptionService encryption,
    required SessionController sessionController,
    required VaultRepository repository,
  }) : _random = random,
       _derivation = derivation,
       _encryption = encryption,
       _sessionController = sessionController,
       _repository = repository;

  final RandomService _random;
  final DerivationService _derivation;
  final EncryptionService _encryption;
  final SessionController _sessionController;
  final VaultRepository _repository;

  @override
  Future<void> intializeNewVault(Map<KeyType, String> initialSecrets) async {
    final masterKey = _random.generateBytes(32);

    for (final entry in initialSecrets.entries) {
      final type = entry.key;
      final secret = entry.value;

      final salt = _random.generateBytes(16);
      final kek = await _derivation.deriveFromString(secret, salt);
      final wmk = await _encryption.encrypt(masterKey, kek);

      await _repository.saveKeySlot(
        KeySlot(
          type: type,
          salt: salt,
          wrappedMasterKey: wmk,
        ),
      );
    }

    _sessionController.setMasterKey(masterKey);
  }

  @override
  Future<void> unlock(KeyType type, String secret) async {
    final keySlot = await _repository.getKeySlotByType(type);

    if (keySlot == null) throw const VaultNotInitializedException();

    try {
      final kek = await _derivation.deriveFromString(secret, keySlot.salt);
      final masterKey = await _encryption.decrypt(
        keySlot.wrappedMasterKey,
        kek,
      );

      _sessionController.setMasterKey(masterKey);
    }
    // Catch both exceptions and errors
    // ignore: avoid_catches_without_on_clauses
    catch (e, st) {
      log.e(
        'Decryption in SecureVaultService failed',
        error: e,
        stackTrace: st,
      );

      throw const InvalidPinException();
    }
  }
}

@riverpod
VaultService vaultService(Ref ref) => SecureVaultService(
  random: ref.watch(randomServiceProvider),
  derivation: ref.watch(derivationServiceProvider),
  encryption: ref.watch(encryptionServiceProvider),
  sessionController: ref.watch(sessionControllerProvider),
  repository: ref.watch(vaultRepositoryProvider),
);
