import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/w_account_list.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:flutter/material.dart';

import 'dummy_etc.dart';

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
        Container(
          margin: EdgeInsets.only(top: appBarHeight),
          child: RefreshIndicator(
            onRefresh: () async {
              await sleepAsync(1000); //서버가 하는 작업 추가
            },
            child: ListView(
              children: [
                height10,
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
        ),
        appBar,
      ],
    );
  }

  get appBar => TossAppBar(appBarHeight: appBarHeight);

  get tossbankButton => RoundSquareContainer(
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

  get assets => RoundSquareContainer(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '자산'.text.bold.size(15).make(),
              ],
            ),
            const AccountList(),
          ],
        ),
      );

  get investment => RoundSquareContainer(
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

  get spend => RoundSquareContainer(
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
          children: etcItems
              .map((e) => RoundSquareContainer(
                    sideMargin: 5,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        e.subTitle.text.medium.color(context.appColors.dimmedText).size(13).make(),
                        Height(10),
                        Row(
                          children: [
                            e.title.text.bold.size(18).make(),
                          ],
                        ),
                        const EmptyExpanded(),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Image.asset(
                              e.image,
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );

  get extraButtons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundSquareContainer(child: '화면설정'.text.make()),
          RoundSquareContainer(child: '자산 추가'.text.make()),
        ],
      );

  get privacyPolicy =>
      '개인정보처리방침 보기'.text.size(12).color(context.appColors.dimmedText).makeCentered().p(40);
}
