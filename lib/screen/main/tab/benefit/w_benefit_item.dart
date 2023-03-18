import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo_benefit_menu.dart';
import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final BenefitMenu menu;

  const BenefitItem({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Image.asset(menu.imagePath, width: 50, height: 50),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menu.subTitle.text.size(12).make(),
              menu.title.text.size(18).color(context.appColors.blueTitleText).bold.make(),
            ],
          ),
        ],
      ),
    );
  }
}
