import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/vault/presentation/screens/auth_screen.dart';
import 'package:frontend/features/vault/presentation/screens/login_screen.dart';
import 'package:frontend/features/vault/presentation/screens/register_screen.dart';
import 'package:frontend/features/vault/presentation/screens/email_verification_screen.dart';
import 'package:frontend/features/vault/presentation/screens/security_method_screen.dart';
import 'package:frontend/features/vault/presentation/screens/create_pin_screen.dart';
import 'package:frontend/features/vault/presentation/screens/pattern_lock_screen.dart';
import 'package:frontend/features/vault/presentation/screens/association_screen.dart';
import 'package:frontend/features/vault/presentation/screens/secret_phrase_screen.dart';
import 'package:frontend/features/vault/presentation/screens/verify_phrase_screen.dart';
// Додай цей імпорт
import 'package:frontend/features/vault/presentation/screens/auth_method_selection_screen.dart';

void main() {
  runApp(const SafePlanTestApp());
}

class SafePlanTestApp extends StatelessWidget {
  const SafePlanTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafePlan Debug',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: '/',

      routes: {
        '/': (context) => const AuthScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/verify-email': (context) => const EmailVerificationScreen(),

        // Новий маршрут для тестування методів входу
        '/auth-method-selection': (context) => const AuthMethodSelectionScreen(),

        '/security-method': (context) => const SecurityMethodScreen(),

        // SETUP (Реєстрація локально)
        '/pin-setup': (context) => const CreatePinScreen(isSetup: true),
        '/pattern-setup': (context) => const PatternLockScreen(isSetup: true),
        '/association-setup': (context) => const AssociationScreen(isSetup: true),
        '/secret-setup': (context) => const SecretPhraseScreen(isSetup: true),
        '/verify-seed': (context) => const VerifyPhraseScreen(),

        // LOGIN (Вхід в існуючий акаунт)
        '/pin-login': (context) => const CreatePinScreen(isSetup: false),
        '/pattern-login': (context) => const PatternLockScreen(isSetup: false),
        '/association-login': (context) => const AssociationScreen(isSetup: false),
        '/secret-login': (context) => const SecretPhraseScreen(isSetup: false),
      },
    );
  }
}