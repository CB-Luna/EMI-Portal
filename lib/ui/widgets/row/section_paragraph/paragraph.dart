import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../data/constants.dart';
import '../../icon_title.dart';

class PrimaryParagraphArea extends StatelessWidget {
  final String? title;
  final String? titleLogo;
  final String? buttonText;
  final bool? textCenter;
  final String paragraph;

  const PrimaryParagraphArea(
      {Key? key,
      this.title,
      this.titleLogo,
      this.buttonText,
      this.textCenter,
      required this.paragraph})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null || titleLogo != null)
          IconTitleWidget(
              title: title,
              titleLogo: titleLogo,
              titleCenter: mobile(context) ? true : textCenter),
        MarkdownBody(
          data: paragraph,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: textTheme.bodyLarge,
              blockSpacing: 25.0,
              textAlign: textCenter != null || mobile(context)
                  ? WrapAlignment.center
                  : WrapAlignment.start),
        ),
        if (paragraph != "") const SizedBox(height: 25.0),
        if (buttonText != null)
          ElevatedButton(onPressed: () {}, child: Text(buttonText!))
      ],
    );
  }
}
