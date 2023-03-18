import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final double appBarHeight = 60;

  const HomeFragment({
    Key? key,
  }) : super(key: key);

  get appBar =>
      SizedBox(
        height: appBarHeight,
        child: AppBar(
          title: Text('토스'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      );

  get tossbankButton =>
      Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 300,
                color: Colors.blue,
                child: Text('토스뱅크'),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Text('토스뱅크'),
              ),
            ),
          ],
        ),
      );

  get investment =>
      Container(
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

  get etcHorizontal =>
      Container(
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

  get extraButtons =>
      Container(
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
              height4,
              investment,
              height4,
              etcHorizontal,
              height4,
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
