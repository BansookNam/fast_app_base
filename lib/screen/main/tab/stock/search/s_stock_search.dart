import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/stock_search_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({Key? key}) : super(key: key);

  @override
  State<StockSearchScreen> createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    Get.put(StockSearchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.background,
      appBar: SearchBar(controller: _controller),
      body: ListView(
        children: const [
          SearchHistoryList(),
          PopularSearchList(),
        ],
      ),
    );
  }
}
