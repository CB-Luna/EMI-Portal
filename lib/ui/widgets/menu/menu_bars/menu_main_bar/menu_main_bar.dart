import 'package:flutter/material.dart';
import 'package:emi_portal/ui/widgets/menu/menu_bars/menu_main_bar/menu/mainmenu_desktop.dart';

import '../../../../../data/constants.dart';
import '../../../components/backgrounds/glass.dart';
import 'menu/mainmenu_mobile.dart';

class MenuMainBar extends StatelessWidget {
  final dynamic logo;
  final dynamic menu;
  final dynamic featBtn;
  const MenuMainBar(
      {Key? key, required this.logo, required this.menu, required this.featBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: GlassMorphism(start: 0.5, end: 0.3, child: SizedBox.shrink()),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: mobile(context)
                  ? MenuMobile(logo: logo, menu: menu, featBtn: featBtn)
                  : MenuDesktop(logo: logo, menu: menu, featBtn: featBtn)),
        ),
      ],
    );
  }
}
