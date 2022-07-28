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
            ? FittedBox(fit: BoxFit.contain, child: subMenu(context))
            : subMenu(context));
  }

  Widget subMenu(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var option in submenu)
        TextButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..color = Colors.white))),
          onPressed: () {
            locator<NavigationService>().navigateTo(option['ButtonLink']);
          },
          child: Text(
            option['ButtonText'],
          ),
        ),
    ]);
  }
}
