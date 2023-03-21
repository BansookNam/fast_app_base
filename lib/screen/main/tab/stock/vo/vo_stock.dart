import 'package:get/utils.dart';

class Stock {
  final String stockName;
  final int yesterdayClosePrice;
  final int currentPrice;
  final String stockImagePath;

  Stock({
    required this.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required this.stockImagePath,
  });

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);
}
