import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/theme/color/dark_app_colors.dart';
import 'package:fast_app_base/common/theme/shadows/dart_app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTheme {
  dark;

  static MaterialColor primarySwatchColor = Colors.lightBlue;

  AbstractThemeColors get appColors {
    switch (this) {
      case CustomTheme.dark:
        return DarkAppColors();
    }
  }

  AbsThemeShadows get appShadows {
    switch (this) {
      case CustomTheme.dark:
        return DarkAppShadows();
    }
  }

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
    }
  }

  static ThemeData darkTheme = ThemeData(
      primarySwatch: primarySwatchColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.notoSansTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      colorScheme: const ColorScheme.dark(background: AppColors.darkGrey));
}
