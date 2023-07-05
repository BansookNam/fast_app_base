import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String prefix = 'AppPreference.';

  static late final SharedPreferences _prefs;

  static String getPrefKey(PreferenceItem item) {
    return '${AppPreferences.prefix}${item.key}';
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  static Future<bool> setValue<T>(PreferenceItem<T> item, T? value) async {
    final String key = getPrefKey(item);
    switch (T) {
      case int:
        return _prefs.setInt(key, value as int);
      case String:
        return _prefs.setString(key, value as String);
      case double:
        return _prefs.setDouble(key, value as double);
      case bool:
        return _prefs.setBool(key, value as bool);
      case const (List<String>):
        return _prefs.setStringList(key, value as List<String>);
      default:
        if (value is Enum) {
          return _prefs.setString(key, describeEnum(value));
        } else {
          throw Exception('$T 타입에 대한 저장 transform 함수를 추가 해주세요.');
        }
    }
  }

  static Future<bool> deleteValue<T>(PreferenceItem<T> item) async {
    final String key = getPrefKey(item);
    return _prefs.remove(key);
  }

  static T getValue<T>(PreferenceItem<T> item) {
    final String key = getPrefKey(item);
    switch (T) {
      case int:
        return _prefs.getInt(key) as T? ?? item.defaultValue;
      case String:
        return _prefs.getString(key) as T? ?? item.defaultValue;
      case double:
        return _prefs.getDouble(key) as T? ?? item.defaultValue;
      case bool:
        return _prefs.getBool(key) as T? ?? item.defaultValue;
      case const (List<String>):
        return _prefs.getStringList(key) as T? ?? item.defaultValue;
      default:
        return transform(T, _prefs.getString(key)) ?? item.defaultValue;
    }
  }

  static T? transform<T>(Type t, String? value) {
    if (value == null) {
      return null;
    }

    switch (t) {
      case CustomTheme:
        return CustomTheme.values.asNameMap()[value] as T?;
      default:
        throw Exception('$t 타입에 대한 transform 함수를 추가 해주세요.');
    }
  }
}

class PreferenceItem<T> {
  final T defaultValue;
  final String key;

  PreferenceItem(this.key, this.defaultValue);

  void call(T value) {
    AppPreferences.setValue<T>(this, value);
  }

  Future<bool> set(T value) {
    return AppPreferences.setValue<T>(this, value);
  }

  T get() {
    return AppPreferences.getValue<T>(this);
  }

  Future<bool> delete() {
    return AppPreferences.deleteValue<T>(this);
  }
}

class NullablePreferenceItem<T> extends PreferenceItem<T?> {
  NullablePreferenceItem(String key, T? defaultValue) : super(key, defaultValue);
}

class RxPreferenceItem<T, R extends Rx<T>> extends PreferenceItem<T> {
  final R rxValue;

  RxPreferenceItem(String key, T defaultValue)
      : rxValue = createRxValue<T, R>(defaultValue),
        super(key, defaultValue);

  @override
  void call(T value) {
    rxValue.value = value;
    super.call(value);
  }

  @override
  Future<bool> set(T value) {
    rxValue.value = value;
    return super.set(value);
  }

  @override
  T get() {
    return AppPreferences.getValue<T>(this);
  }

  R getRx() {
    return rxValue;
  }

  R get rx {
    return rxValue;
  }

  @override
  Future<bool> delete() {
    return AppPreferences.deleteValue<T>(this);
  }

  static R createRxValue<T, R extends Rx<T>>(T defaultValue) {
    switch (T) {
      case int:
        return RxInt(defaultValue as int) as R;
      case double:
        return RxDouble(defaultValue as double) as R;
      case bool:
        return RxBool(defaultValue as bool) as R;
      case String:
        return RxString(defaultValue as String) as R;
      default:
        return Rx<T>(defaultValue) as R;
    }
  }
}
