import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class BenefitFragment extends StatelessWidget {
  const BenefitFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        '혜택'.text.size(20).bold.make(),
      ],
    );
  }
}
