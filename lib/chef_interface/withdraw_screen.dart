import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: h * .1,
            width: w / 4,
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: Icon(
              Icons.done,
              size: h * .06,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: h * .05,
          ),
          Text(
            "Withdraw Successful",
            style: TextStyle(
              fontSize: h * .03,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: h * .03,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: h * .06,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, color: Colors.white),
                    ))),
          )
        ],
      ),
    );
  }
}
