// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro_screen/first_intro.dart';
import '../intro_screen/second_intro.dart';
import '../intro_screen/third_intro.dart';
import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController();

  void _goToNextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const IntroScreenFirst(),
              const IntroScreenSecond(),
              const IntroScreenThird(),
            ],
          ),
          Positioned(
              left: 170,
              bottom: 10,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black, fontSize: h * .02),
                  ))),
          Positioned(
            left: w / 2 / 1.2,
            bottom: 130,
            child: SmoothPageIndicator(
                controller: _pageController, // PageController
                count: 3,
                effect: SlideEffect(
                    spacing: 10.0,
                    radius: 10.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    //  paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.orange.shade100,
                    activeDotColor: Colors.orange) // Customizable effect
                ),
          ),
          const SizedBox(height: 16),
          Positioned(
            left: 10,
            bottom: 60,
            child: SizedBox(
              height: h * .06,
              width: w / 1.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.orange),
                onPressed: () {
                  if (_pageController.hasClients) {
                    if (_pageController.page == 2) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                },
                child: Text(
                  "Next",
                  style:
                      TextStyle(fontSize: h * .03 / 1.2, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
