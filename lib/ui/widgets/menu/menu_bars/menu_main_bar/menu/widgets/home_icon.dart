import 'package:flutter/material.dart';
import 'package:emi_portal/locator.dart';
import 'package:emi_portal/services/graphql_config.dart';
import 'package:emi_portal/services/navigation_service.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key, required this.logo}) : super(key: key);

  final dynamic logo;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.network(setPath(logo)),
        iconSize: 50,
        onPressed: () {
          locator<NavigationService>().navigateTo('/');
        });
  }
}
