import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        '내 포인트'.text.make(),
        emptyExpanded,
        '${569.toComma()} 원'.text.make(),
        width20,
        Icon(
          Icons.arrow_forward_ios,
          color: context.appColors.dimmedIcon,
          size: 15,
        )
      ],
    ).pSymmetric(v: 30);
  }
}
