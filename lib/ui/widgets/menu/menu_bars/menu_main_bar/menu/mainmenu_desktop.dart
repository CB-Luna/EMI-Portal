import 'package:flutter/material.dart';
import '../../../../../../locator.dart';
import '../../../../../../services/navigation_service.dart';
import 'widgets/feat_button.dart';
import 'widgets/home_icon.dart';

class MenuDesktop extends StatelessWidget {
  final dynamic logo;
  final dynamic menu;
  final dynamic featBtn;

  const MenuDesktop(
      {Key? key, required this.logo, required this.menu, required this.featBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      HomeIcon(logo: logo),
      Row(mainAxisSize: MainAxisSize.min, children: [
        for (var option in menu)
          if (option == menu.last)
            OutlinedButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(option['ButtonLink']);
              },
              child: Text(option['ButtonText']),
            )
          else
            TextButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(option['ButtonLink']);
              },
              child: Text(option['ButtonText']),
            ),
      ]),
      FeatButton(featButton: featBtn)
    ]);
  }
}
