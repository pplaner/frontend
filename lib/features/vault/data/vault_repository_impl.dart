import 'package:frontend/core/domain/result.dart';
import 'package:frontend/core/utils/data_source_runner.dart';
import 'package:frontend/features/vault/data/mappers/key_slot_local_mapper.dart';
import 'package:frontend/features/vault/data/sources/vault_local_data_source.dart';
import 'package:frontend/features/vault/domain/key_slot.dart';
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
      call: () => _local.saveKeySlot(slot.toCompanion()),
      mapCore: VaultFailure.core,
    );
  }

  @override
  Future<Result<void, VaultFailure>> saveKeySlots(List<KeySlot> slots) async {
    final companions = slots.map((s) => s.toCompanion()).toList();

    return localRunner(
      call: () => _local.saveKeySlots(companions),
      mapCore: VaultFailure.core,
    );
  }

  @override
  Future<Result<KeySlot?, VaultFailure>> getKeySlotByType(KeyType type) async {
    final result = await localRunner(
      call: () => _local.getKeySlotByType(type),
      mapCore: VaultFailure.core,
    );

    return result.map((model) => model?.toDomain());
  }
}

@riverpod
VaultRepository vaultRepository(Ref ref) =>
    VaultRepositoryImpl(local: ref.watch(vaultLocalDataSourceProvider));
