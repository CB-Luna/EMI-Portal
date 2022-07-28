import 'package:flutter/material.dart';
import '../../../../data/constants.dart';
import 'widgets/video_bg.dart';

class HeroSection extends StatelessWidget {
  final dynamic content;

  const HeroSection({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: mobile(context) ? 300 : size.height * 0.75,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.antiAlias,
        child:
            VideoBackground(videoContent: content['data']['attributes']['url']),
      ),
    );
  }
}
