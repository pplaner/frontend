import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';
import 'package:frontend/core/theme/app_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Верхній відступ
              const SizedBox(height: 50),

              Text(
                'PPlaner',
                style: textTheme.displayLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF424242),
                ),
              ),

              const SizedBox(height: 25),

              Image.asset(
                AppAssets.logo,
                height: 160,
                fit: BoxFit.contain,
              ),

              // Цей відступ регулює, наскільки високо підтягнеться текст
              const SizedBox(height: 50),

              Text(
                'Ваші плани під надійним захистом',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Оберіть спосіб використання',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),

              // Відступ між текстом і кнопками (робимо компактнішим)
              const SizedBox(height: 45),

              FilledButton(
                onPressed: () => Navigator.pushNamed(context, '/security-method'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Створити локальне сховище',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: AppColors.primary.withOpacity(0.1), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'У мене вже є акаунт',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),

              // Нижній Spacer, який тепер виштовхує все вгору
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}