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

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
 
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
                    "Result",
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                color: Color.fromARGB(255, 255, 230, 230),
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "26.00s",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 40,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Duration",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/practice");
                              },
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "24.00s",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 40,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Speaking Time",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/company");
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "00.02s",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 40,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Silence Time",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/practice");
                              },
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                color: Color.fromARGB(255, 255, 230, 230),
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "100wpm",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 35,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Words per minute",
                                      
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/company");
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                color: Color.fromARGB(255, 255, 230, 230),
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "00.50s",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 40,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Slouching\nDuration",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/practice");
                              },
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: GestureDetector(
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text(
                                      "25.50s",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 47, 47, 47),
                                            fontSize: 40,fontWeight:FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Correct Posture\nDuration",
                                      style: GoogleFonts.comfortaa(
                                        textStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 47, 47, 47),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/company");
                              },
                            ),
                          )
                        ],
                      ),
                    ],),),),),
          ],
        ),
      ),
    );
  }
}
