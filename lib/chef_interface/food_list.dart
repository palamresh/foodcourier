import 'package:flutter/material.dart';
import 'package:foodcourier/chef_interface/navigation_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'all_food_item.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<Tab> topTab = <Tab>[
    Tab(
      text: "All",
    ),
    Tab(
      text: "Breakfast",
    ),
    Tab(
      text: "Lunch",
    ),
    Tab(
      text: "Dinner",
    )
  ];

  @override
  void initState() {
    _controller = TabController(
      length: topTab.length,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.orange,
          indicatorColor: Colors.orange,
          tabs: topTab,
          controller: _controller,
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //       backgroundColor: Colors.grey.shade300,
        //       child: IconButton(
        //           onPressed: () {
        //             Navigator.pushReplacement(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => NavigationScreen()));
        //           },
        //           icon: Icon(
        //             Icons.arrow_back_ios,
        //             size: h * .02,
        //           ))),
        // ),
        title: Text("My Food List"),
      ),
      body: TabBarView(controller: _controller, children: [
        AllFoodItem(),
        AllFoodItem(),
        AllFoodItem(),
        AllFoodItem(),
      ]),
    );
  }
}
