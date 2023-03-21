import 'package:fast_app_base/screen/main/tab/stock/vo/vo_simple_stock.dart';

import 'stock_percentage_calculator.dart';

class PopularStock extends SimpleStock with StockPercentageCalculator {
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock({
    required super.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
  });
}
