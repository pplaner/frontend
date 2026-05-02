import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/auth/data/auth_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';
part 'auth_notifier.freezed.dart';

@freezed
sealed class AuthData with _$AuthData {
  const factory AuthData({@Default(false) bool isProcessing}) = _AuthData;
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthData build() => const AuthData();

  Future<void> login(String email, String password) async {
    if (state.isProcessing) return;
    state = state.copyWith(isProcessing: true);

    final result = await ref.read(authServiceProvider).login(email, password);

    state = state.copyWith(isProcessing: false);

    result.fold(
      (success) => print('got void for login'),
      (failure) => print('got failure for login $failure'),
    );
  }

  Future<void> register(String email, String password) async {
    if (state.isProcessing) return;
    state = state.copyWith(isProcessing: true);

    final result = await ref
        .read(authServiceProvider)
        .register(email, password);

    state = state.copyWith(isProcessing: false);

    result.fold(
      (success) => print('got void for register'),
      (failure) => print('got failure for register $failure'),
    );
  }
}
