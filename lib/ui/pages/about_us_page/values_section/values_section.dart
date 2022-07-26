import 'package:flutter/material.dart';

import '../../../../data/constants.dart';
import 'widgets/value_card.dart';

class ValuesSection extends StatelessWidget {
  final dynamic content;

  const ValuesSection({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var iconColors = themeColorsList(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          Text(content['Title'], style: textTheme.headlineLarge),
          const SizedBox(height: 30),

          //Despliegue de cada valor
          Wrap(
            children: [
              for (var value in content['Values'])
                ValueCard(
                    color: iconColors[
                        content['Values'].indexOf(value) % iconColors.length],
                    icon: value['Icon']['data']['attributes']['url'],
                    title: value['Title'],
                    description: value['Description']),
            ],
          )
        ],
      ),
    );
  }
}
