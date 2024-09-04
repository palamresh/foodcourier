import 'package:flutter/material.dart';

class AllNotification extends StatefulWidget {
  const AllNotification({super.key});

  @override
  State<AllNotification> createState() => _AllNotificationState();
}

class _AllNotificationState extends State<AllNotification> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey.shade300,
              ),
              title: Text("Tamir Ahmat placae a new order"),
              subtitle: Text("20 min ago"),
              trailing: Container(
                height: h * .08,
                width: h * .08,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          }),
    );
  }
}
