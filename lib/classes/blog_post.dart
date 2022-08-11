import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/blog_provider.dart';
import '../ui/layouts/not_found_layout.dart';
import '../ui/layouts/post_layout.dart';

class Post {
  const Post(
      {required this.title,
      required this.description,
      required this.slug,
      required this.picture});

  final String title;
  final String description;
  final String slug;
  final String picture;
}

buildPost(dynamic post) {
  return Post(
      title: post['attributes']['Title'],
      description: post['attributes']['Description'],
      slug: post['attributes']['Slug'],
      picture: post['attributes']['Picture']['data']['attributes']['url']);
}

Widget getPostPage(context, slug) {
  final blogProvider = Provider.of<BlogProvider>(context);

  for (Post post in blogProvider.postsList) {
    if (slug == post.slug) {
      return PostLayout(post: post);
    }
  }

  return NotFoundLayout(slug: slug);
}
