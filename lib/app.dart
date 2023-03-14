import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/common/data/prefs.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:fast_app_base/common/theme/custom_theme_holder.dart';
import 'package:fast_app_base/screen/home/s_home.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

import 'common/theme/theme_data.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with Nav {
  late CustomTheme theme;

  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    initTheme();
    super.initState();
  }

  void handleChangeTheme(CustomTheme theme) {
    setState(() => this.theme = theme);
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeHolder(
      changeTheme: handleChangeTheme,
      theme: theme,
      child: MaterialApp(
        navigatorKey: App.navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Image Finder',
        theme: theme.themeData,
        home: const HomeScreen(),
      ),
    );
  }

  void initTheme() async {
    CustomTheme? theme = Prefs.appTheme.get();
    if (theme == null) {
      _initSystemTheme();
    } else {
      this.theme = theme;
    }
  }

  void _initSystemTheme() {
    switch (AppTheme.systemBrightness) {
      case Brightness.dark:
        theme = CustomTheme.dark;
        break;
      case Brightness.light:
        theme = CustomTheme.light;
        break;
    }
  }
}
