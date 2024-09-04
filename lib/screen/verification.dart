import 'dart:async';

import 'package:flutter/material.dart';

import 'package:foodcourier/screen/login_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _remainingTime = 50;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {});
        _remainingTime--;
      } else {
        timer.cancel();
      }
    });
  }

  Widget verficationCode(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: text,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 7, 12, 16),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: h * .1,
                          ),
                          Text(
                            "Verification",
                            style: TextStyle(
                                fontSize: h * .04,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                letterSpacing: 2,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: h * .02 / 1.5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "We have sent a code to your email \n example@gmail.com",
                            style: TextStyle(
                                fontSize: h * .02,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "CODE",
                                  style: TextStyle(
                                      fontSize: h * .03 / 1.5,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Resend ",
                                      style: TextStyle(
                                          fontSize: h * .03 / 1.5,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w800,
                                          decoration: TextDecoration.underline),
                                    ),
                                    Text(
                                      "in.${_remainingTime} sec",
                                      style: TextStyle(
                                          fontSize: h * .03 / 1.5,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: h * .02 / 1.2,
                            ),
                            Row(
                              children: [
                                verficationCode("2"),
                                SizedBox(
                                  width: w * .03,
                                ),
                                verficationCode("5"),
                                SizedBox(
                                  width: w * .03,
                                ),
                                verficationCode("3"),
                                SizedBox(
                                  width: w * .03,
                                ),
                                verficationCode("3")
                              ],
                            ),
                            SizedBox(
                              height: h * .05,
                            ),
                            SizedBox(
                                height: h * .07,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    "VERIFY",
                                    style: TextStyle(
                                        fontSize: h * .03 / 1.3,
                                        letterSpacing: 3,
                                        color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade100),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: h * .02,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
