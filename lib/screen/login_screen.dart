import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/home_screen.dart';
import 'package:foodcourier/screen/forgot_screen.dart';
import 'package:foodcourier/screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool _obsure = true;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
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
                          "Log In",
                          style: TextStyle(
                              fontSize: h * .04,
                              color: Colors.white,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.orange,
                                        focusColor: Colors.orange,
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        }),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(fontSize: h * .02),
                                    )
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotScreen()));
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          fontSize: h * .03 / 1.5,
                                          color: Colors.orange),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            SizedBox(
                                height: h * .06,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    "LOG IN",
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
                                  " Don't have an account?",
                                  style: TextStyle(fontSize: h * .02),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: h * .02),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: h * .01,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "OR",
                                style: TextStyle(fontSize: h * .02),
                              ),
                            ),
                            SizedBox(
                              height: h * .01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      'https://tse3.mm.bing.net/th?id=OIP.aubU2lXxC1ZmPDdf-koomwHaH_&pid=Api&P=0&h=220'),
                                ),
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://tse1.mm.bing.net/th?id=OIP.flV_HAhkgpxUwwDRW-5p9AHaHa&pid=Api&P=0&h=220'),
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      'https://tse3.mm.bing.net/th?id=OIP.HsEahpOEvF5ZYlusObagmQHaHa&pid=Api&P=0&h=220'),
                                )
                              ],
                            )
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
