import 'package:frontend/core/config/app_config.dart';
import 'package:frontend/core/config/env_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
AppConfig appConfig(Ref ref) => const AppConfig(apiUrl: EnvConfig.apiUrl);
