import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachable/teachable.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  String pose = "";
  String posture = "";
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
              "Practice",
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
                      children: [
                        Expanded(
                          child: Container(
                            child: Teachable(
                              path: "pose/index.html",
                              results: (res) {
                                var resp = jsonDecode(res);
                                print("The values are ${res}");

                                setState(() {
                                  if (resp['Perfect!'] * 100 < 80)
                                    posture = "good";
                                  pose = (resp['Perfect!'] * 100.0).toString();
                                  // if (resp['Perfect!'] * 100 > 80) {
                                  //   pose = 90;
                                  // }
                                  // if (resp['Hammer Strike'] * 100 < 50) {
                                  //   pose = 50;
                                  // }
                                  // while (resp['Perfect!'] * 100 < 80) pose = "bad";
                                });
                              },
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              )),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
