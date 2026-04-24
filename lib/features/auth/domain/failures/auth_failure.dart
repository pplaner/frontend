import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/domain/core_failure.dart';

part 'auth_failure.freezed.dart';

@freezed
sealed class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;

  const factory AuthFailure.core(CoreFailure core) = _AuthCore;
}
