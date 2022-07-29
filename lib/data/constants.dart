import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

// D I M E N S I O N E S

//E s c r i t o r i o
const double minWidth = 800.0;
const double maxWidth = 1400.0;
const double maxRangeValue = maxWidth - minWidth;

// F u n c i o n e s   p a r a   t a m a ñ o s   s e g ú n   e l   c o n t e x t o

////Identifica el tamaño actual de la pantalla
screenSize(context) {
  var screenSize = MediaQuery.of(context).size;
  return screenSize;
}

////Identifica si el tamaño de la pantalla es el considerado para un dispositivo móvil o no
mobile(context) {
  bool mobile = screenSize(context).width < minWidth ? true : false;

  return mobile;
}

equiv(context) {
  Size screen = screenSize(context);

  double equiv = mobile(context)
      ? 0.5
      : screen.width > maxWidth
          ? 1
          : ((screen.width - minWidth) / maxRangeValue);

  return equiv;
}

// E S T I L O S

theme(context) {
  return Theme.of(context);
}

textTheme(context) {
  return theme(context).textTheme;
}

colorsTheme(context) {
  return theme(context).colorScheme;
}

themeColorsList(context) {
  return [
    colorsTheme(context).primary.withOpacity(0.35),
    colorsTheme(context).secondary.withOpacity(0.35),
    colorsTheme(context).tertiary.withOpacity(0.35),
  ];
}

//F i l t e r s
const ColorFilter greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

void openNewTab(link) {
  js.context.callMethod('open', [link]);
}
