import 'stock_percentage_calculator.dart';
import 'vo_simple_stock.dart';

class Stock extends SimpleStock with StockPercentageCalculator {
  final int yesterdayClosePrice;
  final int currentPrice;
  final String stockImagePath;

  Stock({
    required super.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required this.stockImagePath,
  });
}
