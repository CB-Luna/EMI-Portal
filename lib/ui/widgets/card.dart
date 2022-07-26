import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../services/graphql_config.dart';

class SingleCard extends StatelessWidget {
  final Color? color;
  final String title;
  final String description;
  final String picture;

  const SingleCard(
      {Key? key,
      this.color,
      required this.title,
      required this.description,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        margin: const EdgeInsets.all(35.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -15,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
                offset: const Offset(0, 35),
              )
            ]),
        child: Column(
          children: [
            Image.network(setPath(picture),
                height: 125, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(title,
                    style: textTheme(context).labelLarge,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text(description,
                    style: textTheme(context).bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4),
                const SizedBox(height: 20.0),
                ElevatedButton(onPressed: () {}, child: const Text("Leer más"))
              ]),
            )
          ],
        ));
  }
}
