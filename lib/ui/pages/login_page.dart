// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../data/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IFrameElement iframeElement = IFrameElement()
      ..src = 'https://emi.cbluna-dev.com/web/#/'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.border = 'none'
      ..onLoad.listen((event) {
        // Aquí iría el ícono de loading
      });

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webpage',
      (int viewId) => iframeElement,
    );

    return Column(
      children: [
        SizedBox(
            height: screenSize(context).height,
            child: const HtmlElementView(viewType: 'webpage')),
      ],
    );
  }
}
