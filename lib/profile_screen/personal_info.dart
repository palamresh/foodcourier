import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/home_screen.dart';
import 'package:foodcourier/profile_screen/edit_profile.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  Widget _customeList(var h, String title, Color color, Widget routes,
      IconData icon, String subtitle) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routes));
      },
      title: Text(title),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          color: color,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Text(
                "EDIT",
                style: TextStyle(
                    color: Colors.orange, decoration: TextDecoration.underline),
              ))
        ],
        title: Text("Personal Info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.orange.shade100,
                ),
                Column(
                  children: [
                    Text(
                      "Vishal Khadak",
                      style: TextStyle(
                          fontSize: h * .04, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "I love fast food",
                      style: TextStyle(
                          fontSize: h * .03, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: h * .05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h * .3 / 1.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    _customeList(h, "FULL NAME", Colors.orange, HomeScreen(),
                        Icons.person, "Vishal Khadak"),
                    _customeList(h, "EMAIL", Colors.blue, HomeScreen(),
                        Icons.email, "heeloa@hella.com"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * .03,
            ),
          ],
        ),
      ),
    );
  }
}
