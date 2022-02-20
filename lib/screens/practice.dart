import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_bunny/screens/components.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teachable/teachable.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:audioplayers/audioplayers.dart';

import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  String pose = "";
  String posture = "";
  String statusText = "";
  bool isComplete = false;
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  late String recordFilePath;

  void play() {
    if (recordFilePath != null) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
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

// generate a random index based on the list length
// and use it to retrieve the element

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(ques,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 47, 47),
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
                      Container(
                        height: 400,
                        child: Teachable(
                          path: "pose/index.html",
                          results: (res) {
                            var resp = jsonDecode(res);
                            print("The values are ${res}");

                            setState(() {
                              if (resp['Perfect!'] * 100 < 80) posture = "good";
                              pose = (resp['Perfect!'] * 100.0).toString();
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Posture",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$pose",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                  // Container(
                                  //   child: pose > 80
                                  //       ? Icon(
                                  //           Icons.add,
                                  //           color: Colors.white,
                                  //         )
                                  //       : Icon(
                                  //           Icons.delete,
                                  //           color: Colors.white,
                                  //         ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  decoration:
                                      BoxDecoration(color: Colors.red.shade300),
                                  child: Center(
                                    child: Text(
                                      'start',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  startRecord();
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade300),
                                  child: Center(
                                    child: Text(
                                      RecordMp3.instance.status ==
                                              RecordStatus.PAUSE
                                          ? 'resume'
                                          : 'pause',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  pauseRecord();
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade300),
                                  child: Center(
                                    child: Text(
                                      'stop',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  stopRecord();
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            statusText,
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            play();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: AlignmentDirectional.center,
                            width: 100,
                            height: 50,
                            child: isComplete && recordFilePath != null
                                ? Text(
                                    "play",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  )
                                : Container(),
                          ),
                        ),
                      ]),
                      CustomButton(name: "Result", nextPath: "/result")
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
