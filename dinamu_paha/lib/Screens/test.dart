import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  late VideoPlayerController _controller;

  @override

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/Video/Bunny.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
        SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size?.width ?? 0,
            height: _controller.value.size?.height ?? 0,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
      ],
        ),
      ),
    );
  }
}
