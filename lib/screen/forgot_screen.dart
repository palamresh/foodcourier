// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:foodcourier/screen/verification.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h * .1,
                        ),
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: h * .04,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: h * .02 / 1.5,
                        ),
                        Text(
                          "Please sign in to your existing account",
                          style: TextStyle(
                              fontSize: h * .02,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )
                      ],
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
                            Text(
                              "EMAIL",
                              style: TextStyle(
                                  fontSize: h * .03 / 1.5,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: h * .02 / 1.2,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  hintText: "example@gmail.com",
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
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
                                                VerificationScreen()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    "SEND CODE",
                                    style: TextStyle(
                                        fontSize: h * .03 / 1.3,
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
