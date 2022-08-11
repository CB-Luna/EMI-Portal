import 'package:flutter/material.dart';
import '../../../../data/constants.dart';
import '../../../../locator.dart';
import '../../../../services/graphql_config.dart';
import '../../../../services/navigation_service.dart';
import '../../../widgets/row/section_picture/section_picture.dart';

class FeaturedPostWidget extends StatelessWidget {
  final dynamic post;

  const FeaturedPostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      alignment: Alignment.center,
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: PictureSection(
                      colored: true,
                      baseColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.25),
                      picture: setPath(post.picture),
                    ),
                  )),
              FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(post.title, style: textTheme.headlineLarge),
                        Text(post.description,
                            style: textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 8),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                            onPressed: () {
                              locator<NavigationService>()
                                  .navigateTo("/blog/${post.slug}");
                            },
                            child: const Text("Leer más"))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
