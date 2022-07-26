import 'package:flutter/material.dart';

import '../../gradient_circle.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeColors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
            right: -20,
            top: -50,
            child: CircleGradient(
                size: 260, color: themeColors.tertiary, angle: 45)),
        Positioned(
            left: 30,
            top: 180,
            child: CircleGradient(
                size: 325, color: themeColors.primary, angle: 15)),
        Positioned(
            right: 50,
            bottom: -80,
            child: CircleGradient(
                size: 200, color: themeColors.secondary, angle: 250))
      ],
    );
  }
}
