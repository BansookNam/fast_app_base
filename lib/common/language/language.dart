import 'package:flutter/material.dart';

import '../../app.dart';
import '../common.dart';

enum Language {
  korean(Locale('ko'), '$basePath/flag/flag_kr.png'),
  english(Locale('en'), '$basePath/flag/flag_us.png');

  final Locale locale;
  final String flagPath;

  const Language(this.locale, this.flagPath);

  static Language find(String key) {
    return Language.values.asNameMap()[key] ?? Language.english;
  }
}

Language get currentLanguage => App.navigatorKey.currentContext!.locale.languageCode == 'ko'
    ? Language.korean
    : Language.english;
