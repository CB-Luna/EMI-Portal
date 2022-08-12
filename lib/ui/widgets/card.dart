import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../locator.dart';
import '../../services/graphql_config.dart';
import '../../services/navigation_service.dart';

class SingleCard extends StatelessWidget {
  final Color? color;
  final String title;
  final String description;
  final String picture;
  final String slug;

  const SingleCard(
      {Key? key,
      this.color,
      required this.title,
      required this.description,
      required this.picture,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: mobile(context) ? 300 : 250,
        height: 400,
        margin: EdgeInsets.symmetric(
            vertical: 35.0, horizontal: mobile(context) ? 15.0 : 35.0),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(alignment: WrapAlignment.center, children: [
                        Text(title,
                            style: textTheme(context).labelLarge,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                        const SizedBox(height: 50),
                        Text(description,
                            style: textTheme(context).bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4),
                      ]),
                      ElevatedButton(
                          onPressed: () {
                            locator<NavigationService>()
                                .navigateTo("/blog/$slug");
                          },
                          child: const Text("Leer más"))
                    ]),
              ),
            )
          ],
        ));
  }
}
