import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';

import '../app_preferences.dart';

class RxnPreferenceItem<T, R extends Rxn<T>> extends NullablePreferenceItem<T> {
  final R _rxnValue;

  RxnPreferenceItem(String key, [T? defaultValue])
      : _rxnValue = createRxnValue<T, R>(defaultValue),
        super(key, defaultValue);

  void load() {
    _rxnValue.value = get();
  }

  @override
  void call(T? value) {
    _rxnValue.value = value;
    super.call(value);
  }

  @override
  Future<bool> set(T? value) {
    _rxnValue.value = value;
    return super.set(value);
  }

  @override
  T? get() {
    return AppPreferences.getValue<T?>(this);
  }

  @override
  Future<bool> delete() {
    return AppPreferences.deleteValue<T?>(this);
  }

  R get rx {
    return _rxnValue;
  }

  static R createRxnValue<T, R extends Rxn<T>>([T? defaultValue]) {
    switch (T) {
      case int:
        return RxnInt(defaultValue as int?) as R;
      case double:
        return RxnDouble(defaultValue as double?) as R;
      case bool:
        return RxnBool(defaultValue as bool?) as R;
      case String:
        return RxnString(defaultValue as String?) as R;
      default:
        return Rxn<T>(defaultValue) as R;
    }
  }
}
