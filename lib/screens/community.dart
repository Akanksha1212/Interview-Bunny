import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: const Color(0xffD9D7F1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Home",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 47, 47, 47), fontSize: 24),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: FutureBuilder(
                          future: _initVideoPlayer(),
                          builder: (context, state) {
                            if (state.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(80),
                                child: AspectRatio(
                                    aspectRatio: _videoPlayerController
                                        .value.aspectRatio,
                                    child: VideoPlayer(_videoPlayerController)),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
