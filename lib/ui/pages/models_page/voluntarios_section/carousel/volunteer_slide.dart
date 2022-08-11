import 'package:flutter/material.dart';

import '../../../../../services/graphql_config.dart';

class VolunteerSlide extends StatelessWidget {
  final dynamic item;

  const VolunteerSlide({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            child: Image.network(setPath(item), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
