import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/constants.dart';
import '../../../../../services/graphql_config.dart';

class ValueCard extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  final String description;

  const ValueCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FractionallySizedBox(
      widthFactor: mobile(context) ? 1 : 0.3,
      child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: SvgPicture.network(setPath(icon),
                    height: 20, color: color.withOpacity(1)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text(
                    title,
                    style: textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    description,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ]),
              )
            ],
          )),
    );
  }
}
