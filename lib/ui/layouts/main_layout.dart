import 'package:flutter/material.dart';
import '../widgets/components/backgrounds/main_background.dart';
import '../widgets/menu/menu.dart';
import 'basic_page_layout.dart';

class MainLayout extends StatelessWidget {
  final Widget view;
  final String pageTitle;
  final bool fullView;

  const MainLayout(
      {Key? key,
      required this.view,
      required this.pageTitle,
      required this.fullView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainBackground(),
        Scaffold(
          body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MenuContainer(),
                Flexible(
                    child: BasicPageLayout(
                        pageTitle: pageTitle,
                        content: view,
                        fullView: fullView)),
              ]),
        ),
      ],
    );
  }
}
