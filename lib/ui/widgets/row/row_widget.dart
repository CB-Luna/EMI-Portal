import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:emi_portal/ui/widgets/row/section_paragraph/paragraph.dart';
import '../../../classes/primary_row.dart';
import '../../../data/constants.dart';
import 'section_picture/section_picture.dart';

class PrimaryRowWidget extends StatelessWidget {
  final PrimaryRow rowContent;
  final bool? clear;
  final bool? colored;
  final double? pictureHeight;

  const PrimaryRowWidget(
      {Key? key,
      required this.rowContent,
      this.clear,
      this.colored,
      this.pictureHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picturePadding = lerpDouble(30, 70, equiv(context));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      alignment: Alignment.center,
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            verticalDirection: VerticalDirection.up,
            textDirection: rowContent.picAtStart || clear != null
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: clear != null
                        ? Container(
                            padding: EdgeInsets.all(picturePadding!),
                            width: double.infinity,
                            child: Image.network(rowContent.picture))
                        : PictureSection(
                            height: pictureHeight,
                            colored: colored != null ? colored! : null,
                            baseColor: rowContent.pictureColor != null
                                ? rowContent.pictureColor!
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.25),
                            picture: rowContent.picture,
                          ),
                  )),
              FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryParagraphArea(
                          title: rowContent.title,
                          titleLogo: rowContent.titleLogo,
                          paragraph: rowContent.paragraph,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
