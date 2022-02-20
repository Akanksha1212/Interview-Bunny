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

import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:path_provider/path_provider.dart';
import 'dart:async';

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
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
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

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Posture",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
                                      'Start',
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
                                          ? 'Resume'
                                          : 'Pause',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _listen();
                                  // pauseRecord();
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
                                      'Stop',
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
                                    "Play",
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

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFFE2),
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.light,
        backgroundColor: Color(0xffA1E3F8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Speech To text'),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/draw');
                },
                icon: Icon(Icons.edit)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color(0xff87dcb2),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 8000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Color(0xff87dcb2),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Column(
            children: [
              Text(
                _text,
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
