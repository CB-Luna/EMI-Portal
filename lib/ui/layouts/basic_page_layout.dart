import 'package:flutter/material.dart';
import 'package:emi_portal/ui/widgets/footer/footer.dart';

import '../widgets/basic_page_header/header.dart';

class BasicPageLayout extends StatelessWidget {
  final String pageTitle;
  final Widget content;
  final bool fullView;

  const BasicPageLayout(
      {Key? key,
      required this.content,
      required this.pageTitle,
      required this.fullView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(visible: !fullView, child: Header(pageTitle: pageTitle)),
          Flexible(fit: FlexFit.loose, child: content),
          const Footer()
        ],
      ),
    );
  }
}
