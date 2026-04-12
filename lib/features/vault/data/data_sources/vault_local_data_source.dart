import 'package:frontend/core/storage/database.dart';
import 'package:frontend/core/storage/storage_providers.dart';
import 'package:frontend/features/vault/data/daos/key_slots_dao.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vault_local_data_source.g.dart';

class VaultLocalDataSource {
  VaultLocalDataSource({required KeySlotsDao keySlotsDao})
    : _keySlotsDao = keySlotsDao;

  final KeySlotsDao _keySlotsDao;

  Future<void> saveKeySlot(KeySlot slot) async {
    await _keySlotsDao.saveKeySlot(slot);
  }

  Future<KeySlot?> getKeySlotByType(KeyType type) {
    return _keySlotsDao.getKeySlotByType(type);
  }
}

@riverpod
VaultLocalDataSource vaultLocalDataSource(Ref ref) => VaultLocalDataSource(
  keySlotsDao: ref.watch(appDatabaseProvider).keySlotsDao,
);
