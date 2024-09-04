import 'package:flutter/material.dart';
import 'package:foodcourier/chef_interface/add_food.dart';
import 'package:foodcourier/chef_interface/chef_interface.dart';

import 'food_list.dart';
import 'notification.dart';
import 'reviews_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 2;
  final _item = [
    const ChefInterface(),
    FoodList(),
    AddFood(),
    NotificationScreen(),
    ReviewsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _item[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_2_sharp,
                size: h * .03,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: h * .03,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Container(
              width: h * 0.08, // Adjust the width of the circle
              height: h * 0.08, // Adjust the height of the circle
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                shape: BoxShape.circle,
                // Background color of the circle
              ),
              child: Icon(
                Icons.add,
                size: h * 0.03,
                color: Colors.orange,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: h * .03,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: h * .03,
              ),
              label: ""),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
