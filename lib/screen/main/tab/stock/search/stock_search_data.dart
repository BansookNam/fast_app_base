import 'package:get/get.dart';

import '../../../../../common/util/local_json.dart';
import '../vo/simple_stock.dart';

class StockSearchData extends GetxController {
  List<SimpleStock> stocks = [];

  @override
  void onInit() {
    () async {
      stocks.addAll(await LocalJson.getObjectList("stock_list.json"));
    }();
    super.onInit();
  }
}
