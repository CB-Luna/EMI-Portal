import 'package:emi_portal/locator.dart';
import 'package:emi_portal/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/constants.dart';
import '../../../../../../providers/mobilemenu_provider.dart';
import '../../../../components/backgrounds/glass.dart';

class MobileMenu extends StatelessWidget {
  final dynamic menuContent;
  const MobileMenu({Key? key, required this.menuContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: mainMenu(context));
  }

  Widget mainMenu(context) {
    var menuData = menuContent;
    final menuProvider = Provider.of<MenuProvider>(context);

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
              for (var option in menuData['MainMenu'])
                TextButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.fill
                            ..color = Colors.white))),
                  onPressed: () {
                    menuProvider.closeMenu();
                    locator<NavigationService>()
                        .navigateTo(option['ButtonLink']);
                  },
                  child: Text(
                    option['ButtonText'],
                  ),
                ),
              const Divider(color: Colors.white, indent: 20, endIndent: 320),
              for (var option in menuData['SubMenu'])
                TextButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.fill
                            ..color = Colors.white))),
                  onPressed: () {
                    menuProvider.closeMenu();
                    locator<NavigationService>()
                        .navigateTo(option['ButtonLink']);
                  },
                  child: Text(
                    option['ButtonText'],
                  ),
                ),
            ]),
      ),
    );
  }
}
