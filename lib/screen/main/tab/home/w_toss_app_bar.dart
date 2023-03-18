import 'package:flutter/material.dart';

import '../../../../common/common.dart';

class TossAppBar extends StatelessWidget {
  final double appBarHeight;

  const TossAppBar({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appbarBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: appBarHeight,
            child: Row(
              children: [
                width5,
                Image.asset(
                  '$basePath/icon/toss.png',
                  height: 30,
                ),
                emptyExpanded,
                Image.asset(
                  '$basePath/icon/map_point.png',
                  height: 30,
                ),
                width10,
                Image.asset(
                  '$basePath/icon/notification.png',
                  height: 30,
                ),
                width10,
              ],
            ),
          ),
          const Line(),
        ],
      ),
    );
  }
}
