import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../classes/blog_post.dart';
import '../../data/constants.dart';
import '../../services/graphql_config.dart';
import '../widgets/row/section_picture/section_picture.dart';

class PostLayout extends StatelessWidget {
  final Post post;

  const PostLayout({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: mobile(context) ? 30.0 : 50.0),
        child: Column(
          children: [
            Text(post.title,
                style: mobile(context)
                    ? textTheme(context).titleMedium
                    : textTheme(context).titleLarge,
                textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: PictureSection(
                height: 250,
                width: double.infinity,
                picture: setPath(post.picture),
                colored: true,
                baseColor: colorsTheme(context).primary.withOpacity(0.25),
              ),
            ),
            MarkdownBody(
              data: post.description,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                  .copyWith(
                      p: textTheme(context).bodyLarge,
                      blockSpacing: 25.0,
                      textAlign: mobile(context)
                          ? WrapAlignment.center
                          : WrapAlignment.start),
            ),
          ],
        ),
      ),
    );
  }
}
