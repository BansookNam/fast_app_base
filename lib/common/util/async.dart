import 'dart:async';

import 'package:flutter/material.dart';

extension AsyncExt on Object {
  Timer delay(Function func, [Duration duration = const Duration(milliseconds: 50)]) {
    return Timer(duration, () {
      if (this is State && !(this as State).mounted) {
        return;
      }
      func();
    });
  }
}

Timer delayTimer(Function func, [Duration duration = const Duration(milliseconds: 50)]) {
  return Timer(duration, () {
    func();
  });
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}

Future sleepWhile(bool Function() predict,
    [Duration duration = const Duration(milliseconds: 50)]) async {
  while (predict()) {
    await sleepAsync(duration);
  }
}

Future sleepUntil(bool Function() predict,
    [Duration duration = const Duration(milliseconds: 50)]) async {
  while (!predict()) {
    await sleepAsync(duration);
  }
}

void runOnUI(void Function() uiFunction) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    uiFunction();
  });
}

class DelayTarget {
  Function? targetFunction;
  Timer? _timer;

  ///ignore last delay targetFunction and give delay to new one.
  void delay(Function function) {
    targetFunction = function;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 20), () {
      if (targetFunction != null) {
        targetFunction!();
      }
    });
  }
}
