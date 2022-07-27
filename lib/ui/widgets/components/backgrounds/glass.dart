import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  final Color? color;
  const GlassMorphism(
      {Key? key,
      required this.child,
      required this.start,
      required this.end,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            gradient: color != null
                ? LinearGradient(colors: [
                    color!.withOpacity(start),
                    color!.withOpacity(end)
                  ])
                : LinearGradient(
                    colors: [
                      Colors.white.withOpacity(start),
                      Colors.white.withOpacity(end),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
            border: Border.all(
              width: 1.5,
              color: color != null
                  ? color!.withOpacity(0.05)
                  : Colors.white.withOpacity(0.05),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
