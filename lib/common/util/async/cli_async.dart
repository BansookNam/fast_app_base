import 'dart:async';

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
