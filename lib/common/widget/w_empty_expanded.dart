import 'package:flutter/material.dart';

class EmptyExpanded extends StatelessWidget {
  final int flex;

  const EmptyExpanded({Key? key, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }
}

Widget get emptyExpanded => const EmptyExpanded();
