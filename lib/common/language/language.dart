import 'package:flutter/material.dart';

import '../../app.dart';
import '../common.dart';

enum Language {
  korean,
  english;

  static Language find(String key) {
    return Language.values.asNameMap()[key] ?? Language.english;
  }

  String get flagPath {
    switch (this) {
      case Language.korean:
        return '$basePath/flag/flag_kr.png';
      case Language.english:
        return '$basePath/flag/flag_us.png';
    }
  }

  Locale get locale {
    switch (this) {
      case Language.korean:
        return const Locale('ko');
      case Language.english:
        return const Locale('en');
    }
  }
}

Language get currentLanguage =>
    App.navigatorKey.currentContext!.locale.languageCode == 'ko' ? Language.korean : Language.english;

class S {}
