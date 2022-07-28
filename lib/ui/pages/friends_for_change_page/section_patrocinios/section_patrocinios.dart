import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../data/constants.dart';
import '../section_Be_Friend/widgets/patrocinios_form.dart';

class SectionPatrocinios extends StatelessWidget {
  final dynamic sectionData;
  final dynamic form;

  const SectionPatrocinios(
      {Key? key, required this.sectionData, required this.form})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70.0),
      child: Wrap(
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
              child: PatrociniosForm(form: form))
        ],
      ),
    );
  }
}
