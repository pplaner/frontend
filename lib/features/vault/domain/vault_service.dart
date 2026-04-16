import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_failure.dart';

abstract class VaultService {
  Future<Result<void, VaultFailure>> intializeNewVault(
    Map<KeyType, String> initialSecrets,
  );
  Future<Result<void, VaultFailure>> unlock(KeyType type, String secret);
}
