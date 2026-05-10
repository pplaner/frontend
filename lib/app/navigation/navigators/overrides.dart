import 'package:frontend/app/navigation/navigators/app_vault_navigator.dart';
import 'package:frontend/features/vault/presentation/navigation/vault_navigator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> overrideFlowDelegates() {
  return [
    vaultNavigatorProvider.overrideWith(AppVaultNavigator.new),
  ];
}
