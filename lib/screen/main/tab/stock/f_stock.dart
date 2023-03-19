import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/w_stock_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_arrow.dart';
import '../home/w_simple_button.dart';
import 'w_interest_stock_list.dart';

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
        ListView(
          padding: EdgeInsets.only(top: appBarHeight),
          children: [
            title,
            tabBar,
            myAccount,
            height20,
            myStocks,
          ],
        ),
        StockAppBar(
          appBarHeight: appBarHeight,
        ),
      ],
    );
  }

  Widget get myAccount => Container(
        color: context.appColors.layerBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            '계좌'.text.make().pOnly(left: 20),
            height10,
            Row(children: [
              width20,
              '4400원'.text.size(24).bold.make(),
              const Arrow(),
              emptyExpanded,
              const RoundSquareButton('채우기'),
              width10
            ]),
            height40,
            const Line(),
            height20,
            const SimpleButton('주문내역'),
            const SimpleButton('판매수익'),
            height10,
          ],
        ),
      );

  Widget get myStocks => Container(
        color: context.appColors.layerBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height40,
            Row(children: [
              width20,
              '관심 주식'.text.size(20).bold.make(),
              emptyExpanded,
              '편집하기'.text.color(context.appColors.dimmedText).make(),
              width20
            ]),
            height20,
            const SimpleButton(
              '기본',
              arrowDirection: AxisDirection.up,
            ),
            const InterestStockList(),
          ],
        ),
      );

  Container get tabBar {
    return Container(
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
            3919.29.toComma().text.size(13).bold.color(context.appColors.plus).make(),
          ],
        ),
      );
}
