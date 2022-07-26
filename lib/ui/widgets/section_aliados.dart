import 'package:flutter/material.dart';
import '../../../../data/constants.dart';
import '../../services/graphql_config.dart';
import 'icon_title.dart';

class AliadosSection extends StatelessWidget {
  final dynamic content;

  const AliadosSection({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    bool mobile = size.width < minWidth ? true : false;

    final double containerSize = mobile ? size.width * 0.15 : 175;
    final double spacing = mobile ? 8.0 : 25;

    final convenioData =
        content['convenio']['data']['attributes']['Logos']['data'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            IconTitleWidget(title: content['Title'], titleCenter: true),
            Text(content['Description'] ?? "",
                style: theme.textTheme.bodyLarge),
            //Despliegue de cada logo de la alianza
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (var logo in convenioData)
                  Container(
                    margin: EdgeInsets.all(spacing),
                    padding: EdgeInsets.all(spacing),
                    width: containerSize,
                    height: containerSize,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            spreadRadius: -15,
                            color: theme.colorScheme.primary.withOpacity(0.25),
                            offset: const Offset(0, 35),
                          )
                        ]),
                    child: Image.network(setPath(logo['attributes']['url']),
                        fit: BoxFit.contain),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
