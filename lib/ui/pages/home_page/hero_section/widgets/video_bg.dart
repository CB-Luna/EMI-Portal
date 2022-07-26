import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../services/graphql_config.dart';

class VideoBackground extends StatefulWidget {
  final dynamic videoContent;
  const VideoBackground({Key? key, required this.videoContent})
      : super(key: key);

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(setPath(widget.videoContent))
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _controller.value.size.width,
        height: _controller.value.size.height,
        child: VideoPlayer(_controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
