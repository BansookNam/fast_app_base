import 'package:fast_app_base/common/common.dart';

import '../../../../../../common/simple_result.dart';
import '../../../../../../common/util/local_json.dart';
import '../../vo/vo_simple_stock.dart';

class StockDataRepository {
  List<SimpleStock> stocks = [];

  void init() async {
    stocks.addAll(await LocalJson.getObjectList("stock_list.json"));
  }

  Future<SimpleResult<List<SimpleStock>, void>> search(String text) async {
    await sleepAsync(300); //서버 더미 응답 속도
    final result = stocks.where((element) => element.stockName.contains(text)).toList();
    return SimpleResult.success(result);
  }
}
