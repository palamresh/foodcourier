import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/food_details.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../home_screen/restaurant_view.dart';
import 'chef_drawer.dart';
import 'food_details.dart';
import 'review_chart.dart';

class ChefInterface extends StatefulWidget {
  const ChefInterface({super.key});

  @override
  State<ChefInterface> createState() => _ChefInterfaceState();
}

class _ChefInterfaceState extends State<ChefInterface> {
  String _currentAddress = 'Fetching address...';
  Position? _currentPosition;

  Widget foodItem(var h, var w) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(
                      restaurantName: "Chicken Thai Biriyani",
                    )));
      },
      child: Container(
        height: h * .3 / 1.5,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * .2,
                  width: w / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade500),
                ),
                SizedBox(
                  width: h * .02 / 1.2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#Breakfast",
                      style: TextStyle(
                          fontSize: h * .03 / 1.5, color: Colors.orange),
                    ),
                    Text(
                      "Chicken Thai Biriyani",
                      style: TextStyle(
                          fontSize: h * .03 / 1.5, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Text(
                      "ID: 23230",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$60",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: h * .01,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              "Done",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: h * .01,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.orange),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.orange),
                            ))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showBottonSheet(var h, var w) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: h * .8,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: h * .01,
                          width: h * .08,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: w / 3,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel)),
                      ],
                    ),
                    Text(
                      "20 Order Running",
                      style: TextStyle(
                          fontSize: h * .02, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    foodItem(h, w),
                    SizedBox(
                      height: h * .01,
                    ),
                    foodItem(h, w),
                    SizedBox(
                      height: h * .01,
                    ),
                    foodItem(h, w),
                    SizedBox(
                      height: h * .01,
                    ),
                    foodItem(h, w),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied, cannot request.');
      return;
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });

    // Get address from coordinates
    _getAddressFromLatLng();
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOCATION",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: h * .02,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${_currentAddress}",
                    style: TextStyle(
                      fontSize: h * .02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Icon(Icons.arrow_downward)
                ],
              )
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChefDrawer()));
                    },
                    icon: Icon(Icons.menu))),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade500,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showBottonSheet(h, w);
                      },
                      child: Container(
                        height: h * .2,
                        width: w / 2 / 1.1,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "20 ",
                              style: TextStyle(
                                  fontSize: h * .06,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "RUNNING ORDERS",
                              style: TextStyle(
                                  fontSize: h * .02,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: h * .2,
                      width: w / 2 / 1.1,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "05 ",
                            style: TextStyle(
                                fontSize: h * .06, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " ORDER REQUEST",
                            style: TextStyle(
                                fontSize: h * .02, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: double.infinity,
                      height: h * .4,
                      child: RevenueChart()),
                ),
                Container(
                  height: h * .2 / 1.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: h * .03 / 1.3,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All Reviews",
                                style: TextStyle(
                                    decorationColor: Colors.orange,
                                    color: Colors.orange,
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: h * .05,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: h * .02,
                              ),
                              Text(
                                "4.9",
                                style: TextStyle(
                                    fontSize: h * .04,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                          SizedBox(
                            width: h * .05,
                          ),
                          Text(
                            "Total 20 Reviews",
                            style: TextStyle(fontSize: h * .03 / 1.2),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Item in this week",
                      style: TextStyle(
                        fontSize: h * .02 / 1.1,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All Reviews",
                          style: TextStyle(
                              decorationColor: Colors.orange,
                              color: Colors.orange,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: h * .2,
                      width: w / 2 / 1.1,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      height: h * .2,
                      width: w / 2 / 1.1,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
