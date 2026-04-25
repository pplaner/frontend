import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryContainer,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondaryContainer,
      tertiary: AppColors.tertiary,
      appBarColor: AppColors.appBarLight,
      error: AppColors.error,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20,
      elevatedButtonRadius: 20,
      filledButtonRadius: 20,
      outlinedButtonRadius: 20,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _buildTextTheme(
      textColor: AppColors.textPrimary,
      subtextColor: AppColors.textSecondary,
    ),
  );

  static ThemeData get dark => FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      primaryContainer: AppColors.darkPrimaryContainer,
      secondary: AppColors.darkSecondary,
      secondaryContainer: AppColors.darkSecondaryContainer,
      tertiary: AppColors.darkTertiary,
      appBarColor: AppColors.darkAppBar,
      error: AppColors.darkError,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useMaterial3Typography: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20,
      elevatedButtonRadius: 20,
      filledButtonRadius: 20,
      outlinedButtonRadius: 20,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _buildTextTheme(
      textColor: AppColors.darkTextPrimary,
      subtextColor: AppColors.darkTextSecondary,
    ),
  );

  // TextTheme Builder

  static TextTheme _buildTextTheme({
    required Color textColor,
    required Color subtextColor,
  }) =>
      GoogleFonts.interTextTheme().copyWith(
        // Великі заголовки екранів (напр. "PPlaner", "Сьогодні")
        displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: textColor,
        ),
        // Середні заголовки (напр. назва розділу)
        headlineMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: textColor,
        ),
        // Підзаголовки карток, діалогів, bottom sheet
        titleLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: textColor,
        ),
        // Назви елементів списку, секцій
        titleMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: textColor,
        ),
        // Допоміжні підписи у списках
        titleSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: subtextColor,
        ),
        // Основний текст контенту
        bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.5,
          color: textColor,
        ),
        // Вторинний текст, підписи (напр. AuthScreen)
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          height: 1.4,
          color: subtextColor,
        ),
        // Дрібні підказки, мітки дати
        bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          color: subtextColor,
        ),
        // Текст кнопок
        labelLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: textColor,
        ),
        // Чіпи, бейджі, малі кнопки
        labelMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: subtextColor,
        ),
        // Підписи до іконок (BottomNavBar)
        labelSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          color: subtextColor,
        ),
      );
}
