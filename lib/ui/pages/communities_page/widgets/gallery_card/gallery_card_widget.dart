import 'package:flutter/material.dart';

import '../../../../../data/constants.dart';
import 'animated_cover.dart';

class GalleryCard extends StatelessWidget {
  final String title;
  final dynamic pictures;
  final Color cardColor;

  const GalleryCard(
      {Key? key,
      required this.title,
      required this.pictures,
      required this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic cardSize = 300;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 20.0, horizontal: mobile(context) ? 15.0 : 35.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          transparentLayer(cardSize - 30, 0, context),
          transparentLayer(cardSize - 15, 12, context),
          AnimatedCover(
              title: title,
              pictures: pictures,
              cardSize: cardSize,
              cardColor: cardColor.withOpacity(1))
        ],
      ),
    );
  }
}

Widget transparentLayer(cardSize, margin, context) {
  return Container(
      margin: EdgeInsets.all(margin),
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorsTheme(context).surface.withOpacity(0.15),
      ));
}
