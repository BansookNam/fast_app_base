import 'package:fast_app_base/screen/main/tab/stock/vo/vo_simple_stock.dart';
import 'package:get/get_utils/get_utils.dart';

class PopularStock extends SimpleStock {
  final int yesterdayClosePrice;
  final int currentPrice;

  PopularStock({
    required super.stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
  });

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);
}
