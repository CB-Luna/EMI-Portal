import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../data/constants.dart';

class SectionPatrocinios extends StatelessWidget {
  final dynamic sectionData;

  const SectionPatrocinios({Key? key, required this.sectionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: [
        FractionallySizedBox(
            widthFactor: mobile(context) ? 1.0 : 0.4,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MarkdownBody(data: sectionData['Description']))),
        FractionallySizedBox(
            widthFactor: mobile(context) ? 1.0 : 0.6,
            child: Column(children: const [Text("Aquí va el form wowowowo")]))
      ],
    );
  }
}
