import '../app_preferences.dart';
import 'preference_item.dart';

export 'package:get/get_rx/get_rx.dart';

class RxPreferenceItem<T, R extends Rx<T>> extends PreferenceItem<T> {
  final R _rxValue;
  bool _isLoaded = false;

  RxPreferenceItem(String key, T defaultValue)
      : _rxValue = createRxValue<T, R>(defaultValue),
        super(key, defaultValue);

  void _load() {
    _isLoaded = true;
    _rxValue.value = get();
  }

  @override
  void call(T value) {
    _rxValue.value = value;
    super.call(value);
  }

  @override
  Future<bool> set(T value) {
    _rxValue.value = value;
    return super.set(value);
  }

  @override
  T get() {
    if(!_isLoaded){
      _load();
    }
    final value =  AppPreferences.getValue<T>(this);
    if(_rxValue.value!=value){
      _rxValue.value = value;
    }
    return _rxValue.value;
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
