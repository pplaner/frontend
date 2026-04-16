import 'package:frontend/app/database/database.dart';
import 'package:frontend/core/domain/result.dart';
import 'package:frontend/core/utils/data_source_runner.dart';
import 'package:frontend/features/vault/data/sources/vault_local_data_source.dart';
import 'package:frontend/features/vault/domain/key_types.dart';
import 'package:frontend/features/vault/domain/vault_failure.dart';
import 'package:frontend/features/vault/domain/vault_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vault_repository_impl.g.dart';

class VaultRepositoryImpl with DataSourceRunner implements VaultRepository {
  VaultRepositoryImpl({
    required VaultLocalDataSource local,
  }) : _local = local;

  final VaultLocalDataSource _local;

  @override
  Future<Result<void, VaultFailure>> saveKeySlot(KeySlot slot) async {
    return localRunner(
      call: () => _local.saveKeySlot(slot),
      mapCore: VaultFailure.core,
    );
  }

  @override
  Future<Result<void, VaultFailure>> saveKeySlots(List<KeySlot> slot) async {
    return localRunner(
      call: () => _local.saveKeySlots(slot),
      mapCore: VaultFailure.core,
    );
  }

  @override
  Future<Result<KeySlot?, VaultFailure>> getKeySlotByType(KeyType type) async {
    return localRunner(
      call: () => _local.getKeySlotByType(type),
      mapCore: VaultFailure.core,
    );
  }
}

@riverpod
VaultRepository vaultRepository(Ref ref) =>
    VaultRepositoryImpl(local: ref.watch(vaultLocalDataSourceProvider));
