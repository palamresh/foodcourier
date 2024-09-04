// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class IntroScreenThird extends StatefulWidget {
  const IntroScreenThird({super.key});

  @override
  State<IntroScreenThird> createState() => _IntroScreenThirdState();
}

class _IntroScreenThirdState extends State<IntroScreenThird> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * .1,
            ),
            Container(
              height: h * .5 / 1.1,
              width: w / 1.4,
              decoration: BoxDecoration(
                  //  color: const Color.fromARGB(255, 5, 6, 6),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://ouch-cdn2.icons8.com/fU1aIV2Y8zBfOYR4YKdGsKlL7paO2tpG_TtHBaih0rE/rs:fit:368:414/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjIx/LzY4M2FlNzE5LWJj/NDEtNGRjOC05OTRl/LWExNThiNjAwNGJm/Zi5wbmc.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: h * .1 / 1.5,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Free Delivery offers ",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: h * .03 / 1,
                          color: Colors.black,
                          fontWeight: FontWeight.w800)),
                ])),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "Get all your loved foods is one place you just place the order we do the rest",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: h * .02,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
