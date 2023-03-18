import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/dummy_benefits.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point.dart';
import 'package:flutter/material.dart';

import 'w_benefit_item.dart';

class BenefitFragment extends StatelessWidget {
  const BenefitFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        '혜택'.text.size(23).bold.make(),
        const PointWidget(),
        height20,
        '혜택 더 받기'.text.size(20).bold.make(),
        height20,
        ...benefitMenus.map((e) => BenefitItem(menu: e)).toList(),
      ],
    );
  }
}
