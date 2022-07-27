import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../services/graphql_config.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      required this.icon,
      required this.iconColor,
      required this.function})
      : super(key: key);

  final String text;
  final Color textColor;
  final Color iconColor;
  final Color buttonColor;
  final dynamic icon;
  final dynamic function;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => function(),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            textStyle: MaterialStateProperty.all(TextStyle(
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = textColor)),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(buttonColor)),
        label: Text(text),
        icon: SvgPicture.network(setPath(icon), width: 15, color: iconColor));
  }
}
