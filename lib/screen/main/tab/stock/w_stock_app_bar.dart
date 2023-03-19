import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import 'search/s_stock_search.dart';

class StockAppBar extends StatelessWidget {
  final double appBarHeight;

  const StockAppBar({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.layerBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: appBarHeight,
            child: Row(
              children: [
                width5,
                emptyExpanded,
                Image.asset(
                  '$basePath/icon/stock_calendar.png',
                  height: 30,
                ),
                width10,
                Tap(
                  onTap: () => Nav.push(const StockSearchScreen()),
                  child: Image.asset(
                    '$basePath/icon/stock_search.png',
                    height: 30,
                  ),
                ),
                width10,
                Image.asset(
                  '$basePath/icon/stock_settings.png',
                  height: 30,
                ),
                width10,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
