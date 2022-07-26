import 'package:flutter/material.dart';

import '../../../../data/constants.dart';
import '../../../../services/graphql_config.dart';
import '../../../widgets/icon_title.dart';
import '../../../widgets/row/section_picture/section_picture.dart';
import 'widgets/categoryBox.dart';

class SectionBeFriends extends StatelessWidget {
  final dynamic sectionData;

  const SectionBeFriends({Key? key, required this.sectionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = sectionData['Categories'];
    var boxesColors = themeColorsList(context);

    getColor(element) {
      return boxesColors[categories.indexOf(element) % boxesColors.length];
    }

    return Column(
      children: [
        IconTitleWidget(title: sectionData['Title'], titleCenter: true),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
            FractionallySizedBox(
                widthFactor: mobile(context) ? 1.0 : 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: PictureSection(
                    height: 550,
                    picture: setPath(
                        sectionData['Picture']['data']['attributes']['url']),
                    baseColor: colorsTheme(context).primary.withOpacity(0.25),
                  ),
                )),
            FractionallySizedBox(
                widthFactor: mobile(context) ? 1.0 : 0.6,
                child: Column(children: [
                  for (var category in categories)
                    CategoryBox(
                      color: getColor(category),
                      title: category['Title'],
                      icon: category['Icon']['data']['attributes']['url'],
                      description: category['Description'],
                    )
                ]))
          ],
        ),
      ],
    );
  }
}
