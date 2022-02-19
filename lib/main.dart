import 'package:flutter/material.dart';
import 'package:interview_bunny/screens/camera_page.dart';
import 'package:interview_bunny/screens/home.dart';
import 'package:interview_bunny/screens/onboarding.dart';
import 'package:interview_bunny/screens/practice.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => MyApp());
        case '/home':
          return MaterialPageRoute(builder: (context) => const Home());
        case '/onboarding':
          return MaterialPageRoute(builder: (context) => OnBoardingPage());
        case '/video':
          return MaterialPageRoute(builder: (context) => CameraPage());
        case '/practice':
          return MaterialPageRoute(builder: (context) => Practice());
        case '/company':
          return MaterialPageRoute(builder: (context) => Practice());
        case '/resume':
          return MaterialPageRoute(builder: (context) => Practice());
        case '/about':
          return MaterialPageRoute(builder: (context) => Practice());
      }
    },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, '/onboarding'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),

        // decoration: BoxDecoration(color: Color(0xffFBFFE2)),
        // child: Image.asset('assets/images/logo.png'),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Image(
            //   image: AssetImage("assets/"),
            // ),
            Image(
              image: AssetImage("assets/IBLogo.png"),
              width: 400,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
