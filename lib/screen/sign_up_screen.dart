// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:foodcourier/screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool _obsure = true;
  bool _retype = true;
  bool _passwordsMatch = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
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
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: h * .04,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: h * .02 / 1.5,
                        ),
                        Text(
                          "Please sign up to get started",
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
                              "Name",
                              style: TextStyle(
                                  fontSize: h * .03 / 1.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: h * .02 / 1.2,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  hintText: "jhon milan",
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                            SizedBox(
                              height: h * .02 / 1.2,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: h * .03 / 1.5,
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
                              height: h * .02 / 1.2,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: h * .03 / 1.5,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obsure,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obsure = !_obsure;
                                      });
                                    },
                                    icon: _obsure == true
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                  ),
                                  hintText: "123454",
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            Text(
                              "Re-type Password",
                              style: TextStyle(
                                  fontSize: h * .03 / 1.5,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _retype,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _retype = !_retype;
                                      });
                                    },
                                    icon: _retype == true
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                  ),
                                  hintText: "Re - type Password",
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            SizedBox(
                                height: h * .06,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordsMatch =
                                          _passwordController.text ==
                                              _confirmPasswordController.text;
                                    });
                                    if (_passwordsMatch) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    }
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    "SIGN UP",
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
                            SizedBox(
                              height: h * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "All ready have an account?",
                                  style: TextStyle(fontSize: h * .02),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text(
                                      "LOG IN",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: h * .02),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: h * .01,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
