import 'dart:math';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_bunny/screens/video_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  var list = [
    'What is your strength?',
    'What is your one weakness?',
    'Why do you want to join our company?',
    'Introduce yourself',
    'Where do you see yourself in 5 years?'
  ];
  var ques = "";
  void NewQuestion() {
    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    setState(() {
      ques = element;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color(0xffD9D7F1),
        body: Column(
          // alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 30,
            ),
            CameraPreview(_cameraController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 150,
                        color: Color(0xffD9D7F1),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(ques,
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 47, 47, 47),
                                              fontSize: 20),
                                        ),
                                        maxLines: 6),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.shuffle),
                                    onTap: NewQuestion,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: FloatingActionButton(
                        backgroundColor: Color(0xffFF6464),
                        child: Icon(_isRecording ? Icons.stop : Icons.circle),
                        onPressed: () => _recordVideo(),
                      ),
                    ),
                  ],
                )),

            // SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      );
    }
  }
}
