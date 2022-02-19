import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D7F1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Home",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome Akanksha",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 47, 47, 47),
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/video-call.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/office-building.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/targ.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/cv.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width / 1.19,
                        child: Card(
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/cv.png",
                                height: 100,
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      )
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
