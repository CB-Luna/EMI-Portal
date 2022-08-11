import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../data/constants.dart';

class PictureSection extends StatelessWidget {
  final Color baseColor;
  final String picture;
  final bool? colored;
  final double? height;
  final double? width;

  const PictureSection(
      {Key? key,
      required this.baseColor,
      required this.picture,
      this.colored,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pictureSizing = lerpDouble(250, 500, equiv(context));

    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
                color: baseColor,
                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: -15,
                    color: baseColor.withOpacity(0.25),
                    offset: const Offset(0, 35),
                  )
                ]),
            child: Container(
              height: height ?? pictureSizing! - (pictureSizing * 0.30),
              width: mobile(context) ? double.infinity : width ?? pictureSizing,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: colored != null ? null : greyscale,
                      image: NetworkImage(picture))),
            )));
  }
}
