import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

abstract mixin class StockPercentageDataProvider {
  int get currentPrice;

  int get yesterdayClosePrice;

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);

  String get todayPercentageString => _isPlus ? '+$todayPercentage%' : '$todayPercentage%';

  bool get _isPlus => currentPrice > yesterdayClosePrice;

  bool get _isSame => currentPrice == yesterdayClosePrice;

  Color getTodayPercentageColor(BuildContext context) {
    if (_isSame) {
      return context.appColors.dimmedText;
    } else if (_isPlus) {
      return context.appColors.plus;
    } else {
      return context.appColors.minus;
    }
  }
}
