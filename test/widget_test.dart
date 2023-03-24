// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/data/app_preferences.dart';
import 'package:fast_app_base/common/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    HttpOverrides.global = null;
    await Isar.initializeIsarCore(download: true);
    await EasyLocalization.ensureInitialized();
    await AppPreferences.init();
  });

  testWidgets('앱 실행 및 기본 텍스트 확인', (WidgetTester tester) async {
    await pumpApp(tester);
    await tester.pumpAndSettle();

    expect(currentLanguage, Language.korean); //startLocale: const Locale('ko') 이 설정되어 있으므로 한국어로 시작
  });
}

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(EasyLocalization(
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      startLocale: const Locale('ko'),
      fallbackLocale: const Locale('ko'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
