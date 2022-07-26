import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../../data/constants.dart';
import '../../../../../services/graphql_config.dart';
import '../../../../widgets/components/backgrounds/glass.dart';

class CategoryBox extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String icon;

  const CategoryBox(
      {Key? key,
      required this.color,
      required this.title,
      required this.description,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          blurRadius: 30,
          spreadRadius: -15,
          color: color.withOpacity(0.20),
          offset: const Offset(0, 20),
        )
      ]),
      child: GlassMorphism(
        color: color,
        start: 0.25,
        end: 0.20,
        child: SizedBox(
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FractionallySizedBox(
                    widthFactor: mobile(context) ? 1.0 : 0.1,
                    child: Image.network(setPath(icon), height: 40)),
                Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: mobile(context) ? 1.0 : 0.88,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: textTheme(context).labelLarge,
                              ),
                              MarkdownBody(
                                data: description,
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
