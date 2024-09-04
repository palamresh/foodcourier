import 'package:flutter/material.dart';
import 'package:foodcourier/map/history.dart';

import 'ongoing.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<Tab> _topTab = [
    Tab(
      text: "Ongoing",
    ),
    Tab(
      text: "History",
    )
  ];

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
        bottom: TabBar(
          labelColor: Colors.orange,
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: _topTab,
          controller: _controller,
        ),
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
      ),
      body: TabBarView(
        children: [Ongoing(), FoodHistory()],
        controller: _controller,
      ),
    );
  }
}
