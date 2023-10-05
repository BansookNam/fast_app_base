import 'dart:async';

import 'package:flutter/material.dart';

extension AsyncExt on Object {
  Timer delay(Function func, Duration ms, {int milliseconds = 300}) {
    return Timer(Duration(milliseconds: milliseconds), () {
      if (this is State && !(this as State).mounted) {
        return;
      }
      func();
    });
  }
}

Timer delayTimer(Function func, {int milliseconds = 300}) {
  return Timer(Duration(milliseconds: milliseconds), () {
    func();
  });
}

Future sleepAsync(int milliSec) {
  return Future.delayed(Duration(milliseconds: milliSec), () => {});
}

Future sleepWhile(bool Function() predict, {milliSeconds = 200}) async {
  while (predict()) {
    await sleepAsync(milliSeconds);
  }
}

Future sleepUntil(bool Function() predict, {milliSeconds = 200}) async {
  while (!predict()) {
    await sleepAsync(milliSeconds);
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
