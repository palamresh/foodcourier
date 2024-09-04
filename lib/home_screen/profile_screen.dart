import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/home_screen.dart';
import 'package:foodcourier/profile_screen/address_screen.dart';
import 'package:foodcourier/profile_screen/personal_info.dart';
import 'package:foodcourier/screen/login_screen.dart';

import '../chef_interface/navigation_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _customeList(
      var h, String title, Color color, Widget routes, IconData icon) {
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
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: h * .03 / 1.4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(.2),
                shape: BoxShape.circle),
            child: Center(
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))),
          )
        ],
        title: Text("Profile"),
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
                height: h * .2,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    _customeList(h, "Personal Info", Colors.orange,
                        PersonalInfo(), Icons.person),
                    _customeList(h, "Address", Colors.blue, AddressScreen(),
                        Icons.location_city),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h * .4 / 1.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    _customeList(h, "Cart", Colors.blueAccent, HomeScreen(),
                        Icons.shopping_bag_rounded),
                    _customeList(h, "Favourite", Colors.pink, HomeScreen(),
                        Icons.favorite_outline),
                    _customeList(h, "Notification", Colors.orange, HomeScreen(),
                        Icons.notifications),
                    _customeList(h, "Payment Method", Colors.lightBlueAccent,
                        HomeScreen(), Icons.payment_rounded),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h * .3 / 1.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    _customeList(h, "FAQs", Colors.blueAccent, HomeScreen(),
                        Icons.question_mark_rounded),
                    _customeList(h, "User Reviews", Colors.greenAccent,
                        HomeScreen(), Icons.reviews_outlined),
                    _customeList(h, "Settings", Colors.indigoAccent,
                        NavigationScreen(), Icons.settings),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h * .1 / 1.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      title: Text("Logout"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.logout,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: h * .03 / 1.4,
                      ),
                    )
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
