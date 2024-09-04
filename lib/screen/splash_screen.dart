import 'package:flutter/material.dart';
import 'package:foodcourier/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService service = SplashService();
  @override
  void initState() {
    service.isLogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'lib/asset/sp.png',
                ))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "F",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),
              ),
              Image.network(
                  'https://img.icons8.com/?size=64&id=jqxXQ2gCP0F7&format=png'),
              Image.network(
                  'https://img.icons8.com/?size=64&id=aEKt19gQv68i&format=png'),
              Text(
                "d",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
