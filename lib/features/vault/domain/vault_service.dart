import 'package:flutter/services.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

abstract class VaultService {
  Future<void> intializeNewVault(Map<KeyType, String> initialSecrets);
  Future<Uint8List> unlock(KeyType type, String secret);
}
