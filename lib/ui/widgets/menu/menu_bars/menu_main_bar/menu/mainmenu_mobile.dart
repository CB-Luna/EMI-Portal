import 'package:flutter/material.dart';

import 'widgets/feat_button.dart';
import 'widgets/home_icon.dart';

class MenuMobile extends StatelessWidget {
  final dynamic logo;
  final dynamic menu;
  final dynamic featBtn;

  const MenuMobile(
      {Key? key, required this.logo, required this.menu, required this.featBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const FractionallySizedBox(
              widthFactor: 0.3,
              child: FittedBox(
                  fit: BoxFit.contain, child: Text("This is the mobile menu"))),
          FractionallySizedBox(widthFactor: 0.4, child: HomeIcon(logo: logo)),
          FractionallySizedBox(
              widthFactor: 0.3, child: FeatButton(featButton: featBtn))
        ]);
  }
}
