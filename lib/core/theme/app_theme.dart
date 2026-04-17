import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color _primary = Color(0xFF8BA88E);
  static const Color _primaryContainer = Color(0xFFDDEEE0);
  static const Color _secondary = Color(0xFF006D39);
  static const Color _secondaryContainer = Color(0xFFF0F0F0);
  static const Color _error = Color(0xFFB00020);

  // Light
  static const Color _lightText = Color(0xFF2D2D2D);
  static const Color _lightSubtext = Color(0xFF828282);
  static const Color _lightSurface = Color(0xFFEBEBEB);
  static const Color _lightAppBar = Color(0xFFF0F0F0);

  // Dark
  static const Color _darkText = Color(0xFFF0F0F0);
  static const Color _darkSubtext = Color(0xFFAAAAAA);
  static const Color _darkSurface = Color(0xFF1A1A1A);
  static const Color _darkAppBar = Color(0xFF242424);

  static ThemeData get light => FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: _primary,
      primaryContainer: _primaryContainer,
      secondary: _secondary,
      secondaryContainer: _secondaryContainer,
      tertiary: Color(0xFF4CAF7D),
      appBarColor: _lightAppBar,
      error: _error,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      elevatedButtonRadius: 20.0,
      filledButtonRadius: 20.0,
      outlinedButtonRadius: 20.0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _buildTextTheme(textColor: _lightText, subtextColor: _lightSubtext),
  );

  static ThemeData get dark => FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: _primary,
      primaryContainer: Color(0xFF2A3D2C),
      secondary: Color(0xFF4CAF7D),
      secondaryContainer: Color(0xFF1E2E1F),
      tertiary: Color(0xFF81C784),
      appBarColor: _darkAppBar,
      error: Color(0xFFCF6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 20.0,
      elevatedButtonRadius: 20.0,
      filledButtonRadius: 20.0,
      outlinedButtonRadius: 20.0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _buildTextTheme(textColor: _darkText, subtextColor: _darkSubtext),
  );

  static TextTheme _buildTextTheme({
    required Color textColor,
    required Color subtextColor,
  }) =>
      GoogleFonts.interTextTheme().copyWith(
        // Використовується для великих заголовків екранів (напр. "PPlaner")
        displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: textColor,
        ),

        // Використовується для середніх заголовків (напр. назва розділу)
        headlineMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: textColor,
        ),

        // Використовується для підзаголовків карток, діалогів
        titleLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: textColor,
        ),

        // Використовується для назв елементів списку, секцій
        titleMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: textColor,
        ),

        // Використовується для допоміжних підписів у списках
        titleSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: subtextColor,
        ),

        // Використовується для основного тексту контенту
        bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.5,
          color: textColor,
        ),

        // Використовується для вторинного тексту, підписів (напр. на AuthScreen)
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          height: 1.4,
          color: subtextColor,
        ),

        // Використовується для дрібних підказок, міток
        bodySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          color: subtextColor,
        ),

        // Використовується для тексту кнопок
        labelLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: textColor,
        ),

        // Використовується для чіпів, бейджів, малих кнопок
        labelMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: subtextColor,
        ),

        // Використовується для підписів до іконок (напр. BottomNavBar)
        labelSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          color: subtextColor,
        ),
      );
}