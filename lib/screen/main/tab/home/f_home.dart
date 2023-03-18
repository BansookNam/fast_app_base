import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_empty_expanded.dart';
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

  get appBar => SizedBox(
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
      );

  get tossbankButton => RoundContainer(
        Row(
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

  get investment => Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Text('토스투자'),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Text('토스투자'),
              ),
            ),
          ],
        ),
      );

  get etcHorizontal => Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Text('토스투자'),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Text('토스투자'),
              ),
            ),
          ],
        ),
      );

  get extraButtons => Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Text('토스투자'),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Text('토스투자'),
              ),
            ),
          ],
        ),
      );

  get privacyPolicy => "개인정보처리방침 보기".text.makeCentered();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            children: [
              Height(appBarHeight),
              tossbankButton,
              height5,
              investment,
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
}
