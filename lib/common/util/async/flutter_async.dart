import 'dart:async';

import 'package:flutter/material.dart';

export 'cli_async.dart';

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

void runOnUI(void Function() uiFunction) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    uiFunction();
  });
}
