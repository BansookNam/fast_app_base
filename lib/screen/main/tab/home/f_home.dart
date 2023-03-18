import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Tap(
              onTap: () {
                Scaffold.of(context).openDrawer();
                //Nav.push(const FavoriteFragment(), context: context);
              },
              child: Text(
                'This is Google Fonts',
                style: GoogleFonts.aclonica(fontSize: 30),
              ).centered()),
        ),
      ],
    );
  }
}
