import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/opensource/vo_package.dart';
import 'package:flutter/material.dart';

class OpensourceItem extends StatelessWidget {
  final Package package;

  const OpensourceItem(this.package, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:40, bottom:30,),
      color: context.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          package.name.text.size(20).bold.make().pOnly(left:20, bottom: 15),
          if(package.authors.isNotEmpty)(package.authors.join(", ")).text.size(14).make().pOnly(left:20),
          if(package.homepage?.isNotEmpty == true)(package.homepage?? "").text.make().pOnly(left:20),
          Container(
            decoration: BoxDecoration(color: context.appColors.drawerBg, border: Border.all(color: context.appColors.divider)),
            margin: const EdgeInsets.only(left: 20, top:10, right:20),
            height: 300,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  (package.license ?? "").text.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
