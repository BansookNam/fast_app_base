import 'package:fast_app_base/screen/main/tab/stock/search/stock_search_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHistoryList extends StatefulWidget {
  const SearchHistoryList({Key? key}) : super(key: key);

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  late final searchHistoryData = Get.find<StockSearchData>();

  get historyList => searchHistoryData.searchHistoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            return SearchHistoryItem(
              onTapDelete: () {
                setState(() {
                  historyList.removeAt(index);
                });
              },
              text: historyList[index],
            );
          },
        ));
  }
}
