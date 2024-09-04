import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class DeliveryManCall extends StatefulWidget {
  const DeliveryManCall({super.key});

  @override
  State<DeliveryManCall> createState() => _DeliveryManCallState();
}

class _DeliveryManCallState extends State<DeliveryManCall> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: h * .6,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue.shade50,
                ),
                Text(
                  "Robert Fox",
                  style: TextStyle(
                      fontSize: h * .03 / 1.3, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Connectiong.......",
                  style: TextStyle(
                      fontSize: h * .02 / 1.3, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: h * .08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: h * .03,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.mic_off_rounded)),
                    ),
                    AvatarGlow(
                      glowColor: Colors.pink,
                      child: Material(
                        // Replace this child with your own
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.red[100],
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.call)),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.volume_down)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade600,
    );
  }
}
