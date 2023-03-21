import 'package:get/utils.dart';

import 'vo_simple_stock.dart';

class Stock extends SimpleStock {
  final int yesterdayClosePrice;
  final int currentPrice;
  final String stockImagePath;

  Stock({
    required super.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required this.stockImagePath,
  });

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);
}
