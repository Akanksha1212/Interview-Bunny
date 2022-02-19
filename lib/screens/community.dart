import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Community extends StatefulWidget {
  final String filePath;

  const Community({Key? key, required this.filePath}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));

    await _videoPlayerController.initialize();

    await _videoPlayerController.setLooping(false);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: Container(
            child: FutureBuilder(
              future: _initVideoPlayer(),
              builder: (context, state) {
                if (state.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: EdgeInsets.all(80),
                    child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController)),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
