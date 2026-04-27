import 'package:flutter/material.dart';
import 'package:frontend/features/vault/presentation/screens/association_screen.dart';
import 'package:frontend/features/vault/presentation/screens/create_pin_screen.dart';
import 'package:frontend/features/vault/presentation/screens/pattern_lock_screen.dart';
import 'package:frontend/features/vault/presentation/screens/secret_phrase_screen.dart';
import 'package:frontend/features/vault/presentation/screens/security_method_screen.dart';
import 'package:go_router/go_router.dart';

part 'vault_routes.g.dart';

@TypedGoRoute<VaultRoute>(
  path: '/vault',
  routes: [
    TypedGoRoute<CreatePinRoute>(path: 'create-pin'),
    TypedGoRoute<CreateGraphRoute>(path: 'create-graph'),
    TypedGoRoute<CreateAssociationRoute>(path: 'create-association'),
    TypedGoRoute<CreateRecoveryRoute>(path: 'create-recovery'),
  ],
)
class VaultRoute extends GoRouteData with $VaultRoute {
  const VaultRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SecurityMethodScreen();
  }
}

class CreatePinRoute extends GoRouteData with $CreatePinRoute {
  const CreatePinRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreatePinScreen();
  }
}

class CreateGraphRoute extends GoRouteData with $CreateGraphRoute {
  const CreateGraphRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PatternLockScreen();
  }
}

class CreateAssociationRoute extends GoRouteData with $CreateAssociationRoute {
  const CreateAssociationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AssociationScreen();
  }
}

class CreateRecoveryRoute extends GoRouteData with $CreateRecoveryRoute {
  const CreateRecoveryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SecretPhraseScreen();
  }
}
