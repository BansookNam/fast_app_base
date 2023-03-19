import 'package:flutter/material.dart';

class RightArrow extends StatelessWidget {
  final double size;

  const RightArrow({Key? key, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      size: size,
    );
  }
}
