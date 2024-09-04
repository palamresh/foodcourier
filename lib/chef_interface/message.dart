import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: Colors.blue,
                  padding: const EdgeInsets.all(5),
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderGradient: const badges.BadgeGradient.linear(
                      colors: [Colors.red, Colors.black]),
                  badgeGradient: const badges.BadgeGradient.linear(
                    colors: [Colors.blue, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: 35, end: -1),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey.shade300,
                ),
              ),

              // leading:
              title: Text("Royal Rarvej"),
              subtitle: Text("sound awesome"),
              trailing: Column(
                children: [
                  Text(DateTime.now().minute.toString() +
                      ":" +
                      DateTime.now().second.toString()),
                  Container(
                    height: h * .02,
                    width: h * .02,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "${1 + index}",
                        style: TextStyle(
                            fontSize: h * .02 / 1.5, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
