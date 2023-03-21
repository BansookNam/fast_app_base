import 'package:get/utils.dart';

abstract class StockPercentageCalculator {
  int get currentPrice;

  int get yesterdayClosePrice;

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);
}
