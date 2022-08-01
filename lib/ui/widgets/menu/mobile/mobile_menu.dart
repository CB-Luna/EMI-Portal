import 'package:flutter/material.dart';

import '../../../../data/constants.dart';
import '../../components/backgrounds/glass.dart';
import 'widgets/menu_list.dart';

class MobileMenu extends StatelessWidget {
  final dynamic menuContent;
  const MobileMenu({Key? key, required this.menuContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: mainMenu(context));
  }

  Widget mainMenu(context) {
    var menuData = menuContent;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
            colorsTheme(context).surface,
            colorsTheme(context).primary,
            colorsTheme(context).surface
          ])),
      child: GlassMorphism(
        color: colorsTheme(context).primary,
        start: 0.75,
        end: 0.80,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuList(menuList: menuData['MainMenu']),
              const Divider(color: Colors.white, indent: 20, endIndent: 320),
              MenuList(menuList: menuData['SubMenu']),
            ]),
      ),
    );
  }
}
