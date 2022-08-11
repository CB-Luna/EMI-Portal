import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/constants.dart';
import '../../../providers/blog_provider.dart';
import '../../widgets/card.dart';
import 'feat_post_section/featured_post_section.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogProvider = Provider.of<BlogProvider>(context);
    var posts = blogProvider.postsList;

    return blogPage(posts, context);
  }

  Widget blogPage(posts, context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mobile(context) ? 10.0 : 50.0),
            child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  for (var post in posts)
                    if (post == posts.first)
                      FeaturedPostWidget(post: post)
                    else
                      SingleCard(
                        title: post.title,
                        description: post.description,
                        picture: post.picture,
                        slug: post.slug,
                      )
                ]),
          )
        ],
      ),
    );
  }
}
