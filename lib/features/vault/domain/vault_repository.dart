import 'package:frontend/app/database/database.dart';
import 'package:frontend/core/domain/result.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_failure.dart';

abstract class VaultRepository {
  Future<Result<void, VaultFailure>> saveKeySlot(KeySlot slot);
  Future<Result<void, VaultFailure>> saveKeySlots(List<KeySlot> slots);
  Future<Result<KeySlot?, VaultFailure>> getKeySlotByType(KeyType type);
}
