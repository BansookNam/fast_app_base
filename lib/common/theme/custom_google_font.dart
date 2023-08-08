import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_base.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_descriptor.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_variant.dart';

class CustomGoogleFont extends GoogleFontsFile {
  final String downloadUrl;

  CustomGoogleFont(this.downloadUrl, super.expectedFileHash, super.expectedLength);

  @override
  String get url => downloadUrl;
}

class CustomGoogleFonts {
  static TextStyle diphylleia({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    final fonts = <GoogleFontsVariant, GoogleFontsFile>{
      const GoogleFontsVariant(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ): CustomGoogleFont(
        'https://fonts.gstatic.com/s/diphylleia/v1/DtVmJxCtRKMixK4_HXsIulwm6gDXvwE.ttf',
        '7027babd4e46661d27d30bc5b26813ade04879df60566796aa06d5d6f51f15c5',
        1942984,
      ),
    };

    return googleFontsTextStyle(
      textStyle: textStyle,
      fontFamily: 'Diphylleia',
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fonts: fonts,
    );
  }

  /// Applies the Ubuntu font family from Google Fonts to every
  /// [TextStyle] in the given [textTheme].
  ///
  /// See:
  ///  * https://fonts.google.com/specimen/Diphylleia
  static TextTheme diphylleiaTextTheme([TextTheme? textTheme]) {
    textTheme ??= ThemeData.light().textTheme;
    return TextTheme(
      displayLarge: diphylleia(textStyle: textTheme.displayLarge),
      displayMedium: diphylleia(textStyle: textTheme.displayMedium),
      displaySmall: diphylleia(textStyle: textTheme.displaySmall),
      headlineLarge: diphylleia(textStyle: textTheme.headlineLarge),
      headlineMedium: diphylleia(textStyle: textTheme.headlineMedium),
      headlineSmall: diphylleia(textStyle: textTheme.headlineSmall),
      titleLarge: diphylleia(textStyle: textTheme.titleLarge),
      titleMedium: diphylleia(textStyle: textTheme.titleMedium),
      titleSmall: diphylleia(textStyle: textTheme.titleSmall),
      bodyLarge: diphylleia(textStyle: textTheme.bodyLarge),
      bodyMedium: diphylleia(textStyle: textTheme.bodyMedium),
      bodySmall: diphylleia(textStyle: textTheme.bodySmall),
      labelLarge: diphylleia(textStyle: textTheme.labelLarge),
      labelMedium: diphylleia(textStyle: textTheme.labelMedium),
      labelSmall: diphylleia(textStyle: textTheme.labelSmall),
    );
  }
}
