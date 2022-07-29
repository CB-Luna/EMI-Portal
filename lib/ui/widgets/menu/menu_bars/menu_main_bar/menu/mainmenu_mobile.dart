import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/mobilemenu_provider.dart';
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
    final menuProvider = Provider.of<MenuProvider>(context);
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          FractionallySizedBox(
              widthFactor: 0.2,
              child: IconButton(
                onPressed: () {
                  menuProvider.opener > 0
                      ? menuProvider.closeMenu()
                      : menuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_rounded),
              )),
          FractionallySizedBox(widthFactor: 0.6, child: HomeIcon(logo: logo)),
          FractionallySizedBox(
              widthFactor: 0.2, child: FeatButton(featButton: featBtn))
        ]);
  }
}
