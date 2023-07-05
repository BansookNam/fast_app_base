import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../common.dart';

class ThemeUtil {
  static Brightness get systemBrightness =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static void changeTheme(BuildContext context, CustomTheme theme) {
    Prefs.appTheme.set(theme); // 또는 Prefs.appTheme(theme) 이렇게 저장도 가능
    context.changeTheme(theme);
  }

  static void toggleTheme(BuildContext context) {
    final theme = context.themeType;
    switch (theme) {
      case CustomTheme.dark:
        changeTheme(context, CustomTheme.light);
        break;
      case CustomTheme.light:
        changeTheme(context, CustomTheme.dark);
        break;
    }
  }
}
