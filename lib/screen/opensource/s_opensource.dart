import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/opensource/vo_package.dart';
import 'package:flutter/material.dart';

import 'w_opensource_item.dart';

/// 아래의 명령어를 통해서, 주기적으로 라이센스 json을 최신화 해주세요.
/// flutter pub run flutter_oss_licenses:generate.dart -o assets/json/licenses.json --json
class OpensourceScreen extends StatefulWidget {
  const OpensourceScreen({super.key});

  @override
  State<OpensourceScreen> createState() => _OpensourceScreenState();
}

class _OpensourceScreenState extends State<OpensourceScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    final list = await LocalJson.getObjectList<Package>("json/licenses.json");
    setState(() {
      packageList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'opensource'.tr().text.make(),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => OpensourceItem(packageList[index]),
        itemCount: packageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Line().pSymmetric(h:20);
        },
      ),
    );
  }
}
