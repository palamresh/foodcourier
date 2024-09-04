import 'package:flutter/material.dart';
import 'package:foodcourier/map/track_order.dart';

class Congratulation extends StatefulWidget {
  const Congratulation({super.key});

  @override
  State<Congratulation> createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * .3,
                width: w / 1.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade400),
              ),
              SizedBox(
                height: h * .01,
              ),
              Text(
                "Congratulation!",
                style: TextStyle(
                    fontSize: h * .04 / 1.2, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .01,
              ),
              Text(
                textAlign: TextAlign.center,
                "You successfully make a payment\n enjoy our service",
                style: TextStyle(
                    fontSize: h * .02 / 1.2, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .03,
              ),
              SizedBox(
                height: h * .07,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.orange),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackOrder()));
                    },
                    child: Text("TRACK ORDER")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
