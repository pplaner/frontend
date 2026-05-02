import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/ui/widgets/back_app_bar.dart';
import 'package:frontend/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:frontend/features/auth/presentation/widgets/email_form_field.dart';
import 'package:frontend/features/auth/presentation/widgets/password_form_field.dart';
import 'package:frontend/features/auth/presentation/widgets/primary_button.dart';
import 'package:frontend/i18n/strings.g.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
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

    await ref
        .read(authProvider.notifier)
        .login(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

    setState(() => _isLoading = false);
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

                PrimaryButton(
                  label: context.t.common.login,
                  isLoading: _isLoading,
                  onPressed: _onLogin,
                ),

                const SizedBox(height: 24),

                // Column(
                //   children: [
                //     Text(
                //       context.t.widgets.no_account,
                //       style: theme.textTheme.bodyMedium,
                //     ),
                //
                //     const SizedBox(height: 4),
                //
                //     GestureDetector(
                //       onTap: () => const RegisterRoute().push<void>(context),
                //       child: Text(
                //         context.t.common.register,
                //         style: theme.textTheme.bodyMedium?.copyWith(
                //           color: AppColors.primary,
                //           fontWeight: FontWeight.bold,
                //           decoration: TextDecoration.underline,
                //           decorationColor: AppColors.primary,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
