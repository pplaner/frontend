import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/ui/widgets/back_app_bar.dart';
import 'package:frontend/core/utils/validators.dart';
import 'package:frontend/features/auth/presentation/navigation/auth_routes.dart';
import 'package:frontend/features/auth/presentation/widgets/email_form_field.dart';
import 'package:frontend/features/auth/presentation/widgets/password_form_field.dart';
import 'package:frontend/i18n/strings.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    // TODO: виклик AuthBloc / AuthRepository для входу
    // TODO: отримати метод захисту з відповіді бекенду і навігувати:
    // 'pin'         → '/login/pin'
    // 'pattern'     → '/login/pattern'
    // 'association' → '/login/association'
    // 'seed'        → '/login/secret'
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (!mounted) return;
    Navigator.of(context).pushNamed('/auth-method-selection');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: const BackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                Text(
                  context.t.widgets.login_title,
                  style: theme.textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                EmailFormField(controller: _emailController),

                const SizedBox(height: 16),

                PasswordFormField(controller: _passwordController),

                const SizedBox(height: 32),

                // ── Кнопка входу ──
                FilledButton(
                  onPressed: _isLoading ? null : _onLogin,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: AppColors.primary,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          context.t.common.login,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                ),

                const SizedBox(height: 24),

                // ── Посилання на реєстрацію ──
                Column(
                  children: [
                    Text(
                      context.t.widgets.no_account,
                      style: theme.textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 4),

                    GestureDetector(
                      onTap: () => const RegisterRoute().push<void>(context),
                      child: Text(
                        context.t.common.register,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required AppColorScheme colors,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: colors.textSecondary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: colors.cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
    );
  }
}
