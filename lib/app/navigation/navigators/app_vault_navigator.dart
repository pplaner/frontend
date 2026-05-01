import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/navigation/app_router.dart';
import 'package:frontend/features/notes/presentation/navigation/notes_routes.dart';
import 'package:frontend/features/vault/presentation/navigation/vault_navigator.dart';

class AppVaultNavigator implements VaultNavigator {
  const AppVaultNavigator(this.ref);

  final Ref ref;

  @override
  void onAuth() {
    // TO-DO: implement onAuth
  }

  @override
  void onVaultUnlocked() {
    ref.read(appRouterProvider).go(const NotesRoute().location);
  }
}
