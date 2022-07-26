import 'dart:ui';

import 'package:flutter/material.dart';
import '../../data/constants.dart';
import '../../services/graphql_config.dart';

class BasicPicture extends StatelessWidget {
  final String picture;

  const BasicPicture({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pictureSize = lerpDouble(60, 100, equiv(context));

    return Container(
      margin: const EdgeInsets.all(5.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(setPath(picture), width: pictureSize),
    );
  }
}
