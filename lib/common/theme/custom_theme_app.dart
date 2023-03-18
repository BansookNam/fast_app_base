import 'package:flutter/material.dart';

import '../data/prefs.dart';
import 'custom_theme.dart';
import 'custom_theme_holder.dart';
import 'theme_util.dart';

class CustomThemeApp extends StatefulWidget {
  final Widget child;

  const CustomThemeApp({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomThemeApp> createState() => _CustomThemeAppState();
}

class _CustomThemeAppState extends State<CustomThemeApp> {
  late CustomTheme theme;

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
      child: widget.child,
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
    switch (ThemeUtil.systemBrightness) {
      case Brightness.dark:
      case Brightness.light:
        theme = CustomTheme.dark;
        break;
    }
  }
}
