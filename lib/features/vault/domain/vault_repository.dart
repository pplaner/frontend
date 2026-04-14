import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/vault/domain/key_types.dart';

abstract class VaultRepository {
  Future<void> saveKeySlot(KeySlot slot);
  Future<KeySlot?> getKeySlotByType(KeyType type);
}
