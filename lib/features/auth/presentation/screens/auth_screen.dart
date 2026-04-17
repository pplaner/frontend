import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 37),
              Text(
                'PPlaner',
                style: textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              Image.asset(
                AppAssets.logo,
                height: 159,
                width: 168,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Text(
                'Ваші плани під надійним захистом',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Оберіть спосіб використання',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 66),
              FilledButton(
                onPressed: () {
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 51),
                ),
                child: const Text('Створити локальне сховище'),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  // Логіка переходу до акаунту
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 51),
                ),
                child: const Text('У мене вже є акаунт'),
              ),
              const SizedBox(height: 262),
            ],
          ),
        ),
      ),
    );
  }
}