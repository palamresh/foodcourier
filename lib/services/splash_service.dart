import 'dart:async';

import 'package:flutter/material.dart';

import '../screen/intro_screen.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }
}
