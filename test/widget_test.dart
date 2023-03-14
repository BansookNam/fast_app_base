// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:fast_app_base/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    //HttpOverrides.global = null;
    await Isar.initializeIsarCore(download: true);
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('앱 실행 및 기본 텍스트 확인', (WidgetTester tester) async {
    await pumpApp(tester);
    await tester.pumpAndSettle();
  });
}

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
