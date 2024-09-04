import 'package:flutter/material.dart';
import 'package:foodcourier/chef_interface/chef_interface.dart';
import 'package:foodcourier/learn_map/convert_address.dart';
import 'package:foodcourier/learn_map/learn_google_map.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chef_interface/navigation_screen.dart';
import 'screen/splash_screen.dart';
import 'webview_example/webview_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());

    // home: LearnGoogleMap());

    ///
    // home: NavigationScreen());
  }
}
