import 'package:frontend/features/vault/domain/key_types.dart';

abstract class VaultService {
  Future<void> intializeNewVault(Map<KeyType, String> initialSecrets);
  Future<void> unlock(KeyType type, String secret);
}
