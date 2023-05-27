import 'dart:async';

import 'package:flutter/material.dart';

mixin RefreshEverySecond<T extends StatefulWidget> on State<T> {
  int refreshMilliSecond = 1;
  Timer? _everySecond;
  bool isRefreshStarted = false;
  Function()? refreshSecondfunction;

  void startTimer({int refreshMilliSecond = 1000}) {
    if (isRefreshStarted) {
      return;
    }
    this.refreshMilliSecond = refreshMilliSecond;
    isRefreshStarted = true;
    _cancelTimer();
    _everySecond = Timer.periodic(Duration(milliseconds: refreshMilliSecond), (Timer t) {
      if (!mounted) {
        return;
      }

      if (refreshSecondfunction != null) {
        refreshSecondfunction!();
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void stopTimer() {
    isRefreshStarted = false;
    _cancelTimer();
  }

  void _cancelTimer() {
    if (_everySecond != null) {
      _everySecond?.cancel();
      _everySecond = null;
    }
  }
}
