import 'dart:async';

void delay(Function func, {int milliseconds = 300}) async {
  Timer(Duration(milliseconds: milliseconds), () {
    func();
  });
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
