import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_blog.dart';
import '../../widgets/card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'feat_post_section/featured_post_section.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryBlog),
          pollInterval: const Duration(seconds: 0),
        ),
        builder: (
          QueryResult result, {
          refetch,
          fetchMore,
        }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          return blogPage(result, context);
        });
  }

  Widget blogPage(result, context) {
    var posts = result.data?['posts']['data'];

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
                      FeaturedPostWidget(post: post['attributes'])
                    else
                      SingleCard(
                        title: post['attributes']['Title'],
                        description: post['attributes']['Description'],
                        picture: post['attributes']['Picture']['data']
                            ['attributes']['url'],
                      )
                ]),
          )
        ],
      ),
    );
  }
}
