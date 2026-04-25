import 'package:flutter/material.dart';

/// Єдине джерело кольорів для всього додатку.
///
/// Використання:
/// ```dart
/// import 'package:frontend/core/theme/app_colors.dart';
///
/// color: AppColors.primary
/// color: AppColors.textPrimary
/// ```
abstract final class AppColors {
  AppColors._();

  // Акцентні кольори

  /// Основний зелений — кнопки, чекбокси, FAB, бордери активних елементів
  static const Color primary = Color(0xFF8BA88E);

  /// Світлий контейнер primary — фон виділеного дня в календарі тощо
  static const Color primaryContainer = Color(0xFFDDEEE0);

  /// Темно-зелений вторинний — акценти, посилання
  static const Color secondary = Color(0xFF006D39);

  /// Світлий контейнер secondary
  static const Color secondaryContainer = Color(0xFFF0F0F0);

  /// Tertiary зелений — додаткові акценти
  static const Color tertiary = Color(0xFF4CAF7D);

  // Кольори тексту

  /// Основний колір тексту (light)
  static const Color textPrimary = Color(0xFF2D2D2D);

  /// Вторинний / сірий текст — підписи, hint, завершені завдання
  static const Color textSecondary = Color(0xFF828282);

  /// Дуже світлий сірий — дні тижня в календарі (SUN MON TUE...)
  static const Color calendarDayOfWeek = Color(0xFFBDBDBD);

  // Фони

  /// Фон всіх екранів
  static const Color background = Color(0xFFEBEBEB);

  /// Фон карток, bottom sheet, календаря
  static const Color surface = Colors.white;

  /// Фон AppBar (light)
  static const Color appBarLight = Color(0xFFF0F0F0);

  /// Фон Bottom Navigation Bar
  static const Color bottomNavBackground = Color(0xFFD9D9D9);

  // Бордери

  /// Бордер звичайних карток завдань
  static const Color cardBorder = Color(0xFFE0E0E0);

  /// Бордер drag handle, розділювачів
  static const Color divider = Color(0xFFD9D9D9);

  // Помилки / Небезпека

  /// Червоний — видалення, помилки
  static const Color error = Color(0xFFB00020);

  /// Світлий фон при свайпі видалення
  static const Color deleteBackground = Color(0xFFFFEBEE);

  // Dark theme

  /// Основний текст (dark)
  static const Color darkTextPrimary = Color(0xFFF0F0F0);

  /// Вторинний текст (dark)
  static const Color darkTextSecondary = Color(0xFFAAAAAA);

  /// Фон екранів (dark)
  static const Color darkBackground = Color(0xFF1A1A1A);

  /// Фон AppBar (dark)
  static const Color darkAppBar = Color(0xFF242424);

  /// Primary container (dark)
  static const Color darkPrimaryContainer = Color(0xFF2A3D2C);

  /// Secondary (dark)
  static const Color darkSecondary = Color(0xFF4CAF7D);

  /// Secondary container (dark)
  static const Color darkSecondaryContainer = Color(0xFF1E2E1F);

  /// Tertiary (dark)
  static const Color darkTertiary = Color(0xFF81C784);

  /// Error (dark)
  static const Color darkError = Color(0xFFCF6679);
}