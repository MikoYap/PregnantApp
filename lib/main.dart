import 'package:flutter/material.dart';
import 'bottom_nav_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashScreen = true;

  @override
  void initState() {
    super.initState();
    // Hide splash screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StorkTale',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _showSplashScreen ? SplashScreen() : BottomNavApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 30,
            child: Image.asset(
              "assets/images/cloud.png",
              width: 70,
              height: 70,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 200,
            left: MediaQuery.of(context).size.width / 2 - 150,
            child: Image.asset(
              "assets/images/appLogo_white.png",
              width: 300,
              height: 300,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 80,
            left: 0,
            right: 0,
            child: Text(
              "Stork tale",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MarckScript',
                fontSize: 50,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 0,
            child: Image.asset(
              "assets/images/cloud.png",
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}