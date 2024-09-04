import 'package:flutter/material.dart';
import 'package:foodcourier/chef_interface/withdraw_screen.dart';
import 'package:foodcourier/home_screen/home_screen.dart';
import 'package:foodcourier/profile_screen/address_screen.dart';
import 'package:foodcourier/profile_screen/personal_info.dart';
import 'package:foodcourier/screen/login_screen.dart';

class ChefDrawer extends StatefulWidget {
  const ChefDrawer({super.key});

  @override
  State<ChefDrawer> createState() => _ChefDrawerState();
}

class _ChefDrawerState extends State<ChefDrawer> {
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
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: h * .3 / 1.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Available Balance",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "\$500.00",
                      style: TextStyle(
                          fontSize: h * .04,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WithdrawScreen()));
                        },
                        child: Text(
                          "Withdraw",
                          style:
                              TextStyle(fontSize: h * .02, color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * .02,
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
                        HomeScreen(), Icons.settings),
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
