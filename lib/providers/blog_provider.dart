import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../classes/blog_post.dart';
import '../services/graphql/queries/query_blog.dart';
import '../services/graphql_config.dart';

class BlogProvider with ChangeNotifier {
  final List<Post> _postsList = [];
  List<Post> get postsList => _postsList;

  BlogProvider() {
    getPosts();
  }

  getPosts() async {
    var graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: GraphQLConfiguration.httpLink,
    );
    QueryResult result =
        await graphQLClient.query(QueryOptions(document: gql(queryBlog)));

    var postsData = result.data?['posts']['data'];

    for (var post in postsData) {
      _postsList.add(buildPost(post));
    }

    notifyListeners();
  }
}
