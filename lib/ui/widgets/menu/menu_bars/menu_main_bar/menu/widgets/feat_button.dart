import 'package:flutter/material.dart';
import 'package:emi_portal/data/constants.dart';
import 'package:emi_portal/locator.dart';
import 'package:emi_portal/services/navigation_service.dart';

class FeatButton extends StatelessWidget {
  const FeatButton({Key? key, required this.featButton}) : super(key: key);

  final dynamic featButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          locator<NavigationService>().navigateTo(featButton['ButtonLink']);
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor:
                MaterialStateProperty.all(colorsTheme(context).surface)),
        child: Text(featButton['ButtonText']));
  }
}
