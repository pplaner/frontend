import 'package:frontend/features/notes/presentation/navigation/notes_routes.dart';
import 'package:frontend/features/vault/domain/vault_state.dart';
import 'package:frontend/features/vault/presentation/navigation/vault_routes.dart';
import 'package:frontend/features/vault/presentation/vault_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: const VaultRoute().location,
    routes: [$vaultRoute, $notesRoute],
    redirect: (context, state) {
      final vaultState = ref.read(vaultProvider);

      final isUnlocked = vaultState is VaultUnlocked;
      final isInVault = state.matchedLocation.startsWith('/vault');

      if (isUnlocked && isInVault) return const NotesRoute().location;
      if (!isUnlocked && !isInVault) return const VaultRoute().location;

      return null;
    },
  );

  ref.listen(vaultProvider, (previous, next) => router.refresh());

  return router;
}
