import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socials/screens/post.dart';
// import 'package:socials/screens/home.dart';
// import 'package:socials/screens/signUp.dart';
// import 'home.dart';
import 'signUp.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key});
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tohome();
  }

  Future<void> Tohome() async {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, signupscreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xba362257),
            Color(0xfffd864e),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        // color: Colors.grey.shade300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Welcome',
              //   style: TextStyle(color: Colors.white, fontSize: 65),
              // ),
              // Text(
              //   'To',
              //   style: TextStyle(color: Colors.white, fontSize: 25),
              // ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'SOC',
                    style: TextStyle(color: Colors.pink, fontSize: 35),
                  ),
                  TextSpan(
                    text: 'I',
                    style: TextStyle(color: Colors.green, fontSize: 55),
                  ),
                  TextSpan(
                    text: 'ALS',
                    style: TextStyle(color: Colors.blue, fontSize: 35),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
