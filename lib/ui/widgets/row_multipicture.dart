import 'package:flutter/material.dart';
import '../../../services/graphql_config.dart';
import '../../data/constants.dart';
import 'basic_picture.dart';
import 'row/section_paragraph/paragraph.dart';

class RowMultipicture extends StatelessWidget {
  final String title;
  final String icon;
  final String description;
  final dynamic pictures;
  final bool? rtl;

  const RowMultipicture(
      {Key? key,
      required this.title,
      required this.icon,
      required this.description,
      required this.pictures,
      this.rtl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = mobile(context);
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      textDirection: rtl != null ? TextDirection.rtl : TextDirection.ltr,
      children: [
        FractionallySizedBox(
          widthFactor: isMobile ? 1 : 0.6,
          child: PrimaryParagraphArea(
              title: title, titleLogo: setPath(icon), paragraph: description),
        ),

        //Sección de ODS Relacionados
        FractionallySizedBox(
          widthFactor: isMobile ? 1 : 0.4,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (var picture in pictures)
                BasicPicture(
                  picture: picture['attributes']['url'],
                )
            ],
          ),
        )
      ],
    );
  }
}
