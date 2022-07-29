import 'package:flutter/material.dart';
import 'menu_bars/menu_main_bar/menu_main_bar.dart';
import 'menu_bars/menu_services_bar.dart';

class MenuContainer extends StatelessWidget {
  final dynamic menuContent;
  const MenuContainer({Key? key, required this.menuContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var menuData = result.data?['webMenu']['data']['attributes'];
    var menuData = menuContent;

    return Column(children: [
      MenuMainBar(
          logo: menuData['logo']['data']['attributes']['url'],
          menu: menuData['MainMenu'],
          featBtn: menuData['FeaturedButton']),
      MenuServicesBar(submenu: menuData['SubMenu']),
    ]);
  }
}
