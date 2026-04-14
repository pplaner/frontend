import 'package:frontend/app/database/database.dart';
import 'package:frontend/features/vault/data/sources/vault_local_data_source.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vault_repository_impl.g.dart';

class VaultRepositoryImpl implements VaultRepository {
  VaultRepositoryImpl({
    required VaultLocalDataSource local,
  }) : _local = local;

  final VaultLocalDataSource _local;

  @override
  Future<KeySlot?> getKeySlotByType(KeyType type) {
    return _local.getKeySlotByType(type);
  }

  @override
  Future<void> saveKeySlot(KeySlot slot) async {
    await _local.saveKeySlot(slot);
  }
}

@riverpod
VaultRepository vaultRepository(Ref ref) =>
    VaultRepositoryImpl(local: ref.watch(vaultLocalDataSourceProvider));
