import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class BenefitFragment extends StatelessWidget {
  const BenefitFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Tap(onTap: () {}, child: '혜택'.text.make().centered()),
        ),
      ],
    );
  }
}
