import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String pageTitle;
  const Header({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(pageTitle,
          style: textTheme.titleLarge, textAlign: TextAlign.center),
    );
  }
}
