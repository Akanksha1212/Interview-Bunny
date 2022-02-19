import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width / 1.19,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome Akanksha!",
                                    style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 47, 47, 47),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Text(
                                    "Are you ready to ace all \nyour interviews?",
                                    style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 47, 47, 47),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/bun.gif",
                                height: 80,
                                width: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              color: Color.fromARGB(255, 255, 230, 230),
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/video-call.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Practice",
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
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/office-building.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Company Info",
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
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/targ.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Get feedback",
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
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Card(
                              color: Color.fromARGB(255, 255, 230, 230),
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/cv.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Resume Review",
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
                          )
                        ],
                      ),
                      Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width / 1.19,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "About Interview Bunny",
                                style: GoogleFonts.comfortaa(
                                  textStyle: const TextStyle(
                                      color:
                                          const Color.fromARGB(255, 47, 47, 47),
                                      fontSize: 15),
                                ),
                              ),
                              Image.asset(
                                "assets/bunny.png",
                                height: 80,
                                width: 80,
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
