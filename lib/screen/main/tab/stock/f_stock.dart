import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/w_stock_app_bar.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  final double appBarHeight = 50;
  late final tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StockAppBar(
          appBarHeight: appBarHeight,
        ),
        ListView(
          padding: EdgeInsets.only(top: appBarHeight),
          children: [
            title,
            Container(
              color: context.appColors.layerBackground,
              child: Column(
                children: [
                  TabBar(
                    tabs: ['내 주식'.text.make(), '오늘의 발견'.text.make()],
                    controller: tabController,
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    labelPadding: const EdgeInsets.symmetric(vertical: 20),
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const Line(),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget get title => Container(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
        color: context.appColors.layerBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '토스증권'.text.size(24).bold.make(),
            width20,
            'S&P 500'.text.size(13).bold.color(context.appColors.dimmedText).make(),
            width10,
            3919.29.toComma().text.size(13).bold.color(context.appColors.plusRed).make(),
          ],
        ),
      );
}
