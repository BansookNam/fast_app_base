import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/dummy_stocks.dart';
import 'package:flutter/material.dart';

import 'w_stock_item.dart';

class InterestStockList extends StatefulWidget {
  const InterestStockList({Key? key}) : super(key: key);

  @override
  State<InterestStockList> createState() => _InterestStockListState();
}

class _InterestStockListState extends State<InterestStockList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        ...myInterestStocks.map((e) => StockItem(e)).toList(),
      ],
    );
  }
}
