import 'package:flutter/material.dart';

import '../../../../data/constants.dart';
import '../../../../locator.dart';
import '../../../../services/navigation_service.dart';

class MenuServicesBar extends StatelessWidget {
  final dynamic submenu;

  const MenuServicesBar({Key? key, required this.submenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: colorsTheme(context).primary,
        width: double.infinity,
        child: screenSize(context).width < 500
            ? FittedBox(fit: BoxFit.contain, child: subMenu())
            : subMenu());
  }

  Widget subMenu() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var option in submenu)
        TextButton(
          onPressed: () {
            locator<NavigationService>().navigateTo(option['ButtonLink']);
          },
          child: Text(option['ButtonText']),
        ),
    ]);
  }
}
