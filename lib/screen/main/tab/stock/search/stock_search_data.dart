import 'package:fast_app_base/screen/main/tab/stock/search/repository/stock_data_repository.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../common/common.dart';
import '../vo/vo_simple_stock.dart';

class StockSearchData extends GetxController {
  final repository = StockDataRepository();
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> searchResult = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    repository.init();
    super.onInit();
  }

  Future<void> search(String text) async {
    if (isBlank(text)) {
      searchResult.clear();
      return;
    }
    final dateTime = DateTime.now();
    final result = await repository.search(text);
    final afterdateTime = DateTime.now();
    print('검색 소요 시간: ${afterdateTime.difference(dateTime).inMilliseconds}ms');
    result.runIfSuccess((data) {
      searchResult.assignAll(data);
    });
    result.runIfFailure((error) {
      //실패 처리
    });
  }

  void addSearchHistory(String stockName) {
    searchHistoryList.insert(0, stockName);
  }
}
