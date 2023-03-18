import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/w_account_list.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final double appBarHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            children: [
              Height(appBarHeight + 10),
              tossbankButton,
              height5,
              assets,
              height5,
              investment,
              height5,
              spend,
              height5,
              etcHorizontal,
              height5,
              extraButtons,
              privacyPolicy,
            ],
          ),
        ),
        appBar,
      ],
    );
  }

  get appBar => TossAppBar(appBarHeight: appBarHeight);

  get tossbankButton => RoundContainer(
        child: Row(
          children: [
            '토스뱅크'.text.bold.size(20).make(),
            emptyExpanded,
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      );

  get assets => RoundContainer(
        child: Row(
          children: [
            '자산'.text.bold.size(15).make(),
            const AccountList(),
          ],
        ),
      );

  get investment => RoundContainer(
        child: Row(
          children: [
            '투자'.text.bold.size(20).make(),
            emptyExpanded,
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      );

  get spend => RoundContainer(
        child: Row(
          children: [
            '소비'.text.bold.size(20).make(),
            emptyExpanded,
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      );

  get etcHorizontal => SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            RoundContainer(
              height: 150,
              sideMargin: 5,
              child: Row(
                children: [
                  '토스뱅크'.text.bold.size(20).make(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
            RoundContainer(
              height: 150,
              sideMargin: 5,
              child: Row(
                children: [
                  '토스뱅크'.text.bold.size(20).make(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  get extraButtons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundContainer(child: '화면설정'.text.make()),
          RoundContainer(child: '자산 추가'.text.make()),
        ],
      );

  get privacyPolicy =>
      "개인정보처리방침 보기".text.size(12).color(context.appColors.dimmedText).makeCentered().p(40);
}
