import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../locator.dart';
import '../../../../../providers/mobilemenu_provider.dart';
import '../../../../../services/navigation_service.dart';
import '../../../components/buttons/custom_iconbutton.dart';

class MenuList extends StatelessWidget {
  final dynamic menuList;
  const MenuList({Key? key, required this.menuList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: mainMenu(context));
  }

  Widget mainMenu(context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var option in menuList)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomIconButton(
                text: option['ButtonText'],
                textColor: Colors.white,
                buttonColor: Colors.transparent,
                icon: option['ButtonIcon']['data']['attributes']['url'],
                iconColor: Colors.white,
                function: () {
                  menuProvider.closeMenu();
                  locator<NavigationService>().navigateTo(option['ButtonLink']);
                },
              ),
            ),
        ]);
  }
}
