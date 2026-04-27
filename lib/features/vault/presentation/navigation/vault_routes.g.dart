// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$vaultRoute];

RouteBase get $vaultRoute => GoRouteData.$route(
  path: '/vault',
  factory: $VaultRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'create-pin', factory: $CreatePinRoute._fromState),
    GoRouteData.$route(
      path: 'create-graph',
      factory: $CreateGraphRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'create-association',
      factory: $CreateAssociationRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'create-recovery',
      factory: $CreateRecoveryRoute._fromState,
    ),
  ],
);

mixin $VaultRoute on GoRouteData {
  static VaultRoute _fromState(GoRouterState state) => const VaultRoute();

  @override
  String get location => GoRouteData.$location('/vault');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreatePinRoute on GoRouteData {
  static CreatePinRoute _fromState(GoRouterState state) =>
      const CreatePinRoute();

  @override
  String get location => GoRouteData.$location('/vault/create-pin');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateGraphRoute on GoRouteData {
  static CreateGraphRoute _fromState(GoRouterState state) =>
      const CreateGraphRoute();

  @override
  String get location => GoRouteData.$location('/vault/create-graph');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateAssociationRoute on GoRouteData {
  static CreateAssociationRoute _fromState(GoRouterState state) =>
      const CreateAssociationRoute();

  @override
  String get location => GoRouteData.$location('/vault/create-association');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateRecoveryRoute on GoRouteData {
  static CreateRecoveryRoute _fromState(GoRouterState state) =>
      const CreateRecoveryRoute();

  @override
  String get location => GoRouteData.$location('/vault/create-recovery');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
