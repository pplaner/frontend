import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xFF8BA88E);
  static const Color _textColor = Color(0xFF2D2D2D);
  static const Color _secondaryTextColor = Color(0xFF828282);

  static ThemeData get light => FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: _primaryColor,
      primaryContainer: Color(0xFFDDEEE0),
      secondary: _textColor,
      secondaryContainer: Color(0xFFF0F0F0),
      tertiary: Color(0xFF006D39),
      appBarColor: Color(0xFFF0F0F0),
      error: Color(0xFFB00020),
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
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: _textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 2.9, // Line height 35px з Figma
        color: _textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 2.9,
        color: _secondaryTextColor,
      ),
      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: _textColor,
      ),
    ),
  );

  static ThemeData get dark => FlexThemeData.dark(
    scheme: FlexScheme.materialBaseline,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      defaultRadius: 16.0,
      filledButtonRadius: 16.0,
      useTextTheme: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme(),
  );
}