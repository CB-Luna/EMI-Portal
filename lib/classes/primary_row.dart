import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/graphql_config.dart';

class PrimaryRow {
  bool picAtStart;
  String? titleLogo;
  String? title;
  String paragraph;
  String picture;
  String? pictureBg;
  Color? pictureColor;
  String? buttonText;
  String? buttonLink;

  PrimaryRow(
      {required this.picAtStart,
      this.titleLogo,
      this.title,
      required this.paragraph,
      required this.picture,
      this.pictureBg,
      this.pictureColor,
      this.buttonText,
      this.buttonLink});
}

setRow(row) {
  return PrimaryRow(
    picAtStart: true,
    title: row['Title'],
    titleLogo: row['Icon']['data'] == null
        ? null
        : setPath(row['Icon']['data']['attributes']['url']),
    paragraph: row['Description'],
    picture: row['Picture']['data'] == null
        ? null
        : setPath(row['Picture']['data']['attributes']['url']),
    // buttonText: row['Button'] == null ? null : row['Button']['ButtonText'],
    // buttonLink: row['Button'] == null ? null : row['Button']['Link'],
  );
}
