import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1A1A1A)
          : const Color(0xFFEBEBEB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Text(
                'PPlaner',
                style: textTheme.displayLarge,
              ),
              const SizedBox(height: 24),
              Image.asset(
                AppAssets.logo,
                height: 159,
                width: 168,
                fit: BoxFit.contain,
              ),
              const Spacer(flex: 2),
              Text(
                'Ваші плани під надійним захистом',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Оберіть спосіб використання',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const Spacer(flex: 3),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 51),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Створити локальне сховище',
                  style: textTheme.labelLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 51),
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(color: colorScheme.primary, width: 1),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'У мене вже є акаунт',
                  style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
                ),
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}