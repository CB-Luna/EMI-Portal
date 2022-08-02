import 'package:flutter/material.dart';

import '../../../../../services/graphql_config.dart';

class CarouselSlide extends StatelessWidget {
  final dynamic item;

  const CarouselSlide({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        child: Image.network(setPath(item), fit: BoxFit.cover),
      ),
    );
  }
}
