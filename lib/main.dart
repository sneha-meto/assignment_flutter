import 'package:assignmentapp/List_Page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> color1;
  Animation<double> color2;
  Animation<double> color3;
  Animation<double> color4;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ListPage())));
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    color1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.3,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );

    color2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    color3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.6,
          curve: Curves.ease,
        ),
      ),
    );

    color4 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );

    controller.forward();

    controller.addListener(() {
      setState(() {
        controller.value;
        print(controller.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 240, horizontal: 30),
        child: Stack(children: [
          Transform.scale(
            scale: color1.value,
            child: Opacity(
              opacity: color1.value,
              child: Align(
                alignment: Alignment(-1, 0.5),
                child: Container(
                  height: 270,
                  child: Image.asset(
                    "assets/images/blue-500x500.png",
                  ),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: color2.value,
            child: Opacity(
              opacity: color2.value,
              child: Align(
                alignment: Alignment(-0.6, -0.5),
                child: Container(
                  height: 190,
                  child: Image.asset(
                    "assets/images/orange-500x500.png",
                  ),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: color3.value,
            child: Opacity(
              opacity: color3.value,
              child: Align(
                alignment: Alignment(2, 2),
                child: Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/purple-500x500.png",
                  ),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: color4.value,
            child: Opacity(
              opacity: color4.value,
              child: Align(
                alignment: Alignment(1.2, -1),
                child: Container(
                  height: 280,
                  child: Image.asset(
                    "assets/images/red-500x500.png",
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 240,
              child: Image.asset(
                "assets/images/White-Logo-With-Text-500x500.png",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
