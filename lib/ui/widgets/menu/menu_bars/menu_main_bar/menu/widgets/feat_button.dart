import 'package:flutter/material.dart';
import 'package:emi_portal/data/constants.dart';

class FeatButton extends StatelessWidget {
  const FeatButton({Key? key, required this.featButton}) : super(key: key);

  final dynamic featButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        openNewTab(featButton['ButtonLink']);
      },
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor:
              MaterialStateProperty.all(colorsTheme(context).surface)),
      child: Text(featButton['ButtonText']),
    );
  }
}
