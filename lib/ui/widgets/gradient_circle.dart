import 'dart:math';

import 'package:flutter/material.dart';

class CircleGradient extends StatelessWidget {
  const CircleGradient(
      {Key? key, required this.size, required this.color, required this.angle})
      : super(key: key);

  final double size;
  final Color color;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                transform: GradientRotation((angle * pi) / 180),
                colors: [
                  color.withOpacity(0.30),
                  color.withOpacity(0.15),
                  color.withOpacity(0.025),
                ])));
  }
}
