import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../common/common.dart';
import '../../../../../common/util/local_json.dart';
import '../vo/vo_simple_stock.dart';

class StockSearchData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<SimpleStock> searchResult = <SimpleStock>[].obs;

  @override
  void onInit() {
    () async {
      stocks.addAll(await LocalJson.getObjectList("stock_list.json"));
    }();
    super.onInit();
  }

  void search(String text) {
    if (isBlank(text)) {
      searchResult.clear();
      return;
    }
    searchResult.value = stocks.where((element) => element.stockName.contains(text)).toList();
  }
}
