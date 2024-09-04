import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:foodcourier/home_screen/food_image.dart';
import 'package:foodcourier/home_screen/profile_screen.dart';
import 'package:foodcourier/home_screen/search_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showdialogBox(var h) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.orange,
            content: Container(
              height: h * .5 / 1.2,
              width: 300,
              color: Colors.orange,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          size: h * .05,
                          Icons.cancel_presentation,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    "Hurry Offers!",
                    style: TextStyle(
                        shadows: [BoxShadow(offset: Offset(1.2, 3))],
                        fontSize: h * .05,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: h * .04,
                  ),
                  Text(
                    "#1234CD2",
                    style: TextStyle(
                        shadows: [BoxShadow(offset: Offset(1.2, 3))],
                        fontSize: h * .04,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: h * .04,
                  ),
                  Text(
                    "Use the cupon get 25% discount",
                    style: TextStyle(
                        fontSize: h * .03 / 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: h * .04,
                  ),
                  SizedBox(
                    height: h * .06,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: Text(
                        "GOT IT",
                        style: TextStyle(
                            fontSize: h * .03 / 1.2, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour > 6 && hour < 12) {
      return "Good Morning";
    } else if (hour > 12 && hour < 18) {
      return "Good Afternoon";
    } else if (hour > 18 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  String _currentAddress = 'Fetching location...';

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation().then((value) {
      getAddress(value.latitude, value.longitude);
    });
    // _getCurrentLocation();
  }

  String address = '';

  getAddress(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks);

    setState(() {
      _currentAddress = placemarks.reversed.last.subLocality.toString();
    });
    address = placemarks.reversed.last.subAdministrativeArea.toString();
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, trackError) {
      print("$error");
    });

    return await Geolocator.getCurrentPosition();
  }
  // Future<void> _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Location services enabled check
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error('Location permissions are permanently denied');
  //   }

  //   // Get current location
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

  //   // Get address from coordinates using geocoding
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);

  //   Placemark place = placemarks[0];
  //   setState(() {
  //     _currentAddress = '${place.subAdministrativeArea},';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DELIVERY TO",
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
        actions: [
          badges.Badge(
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
            position: badges.BadgePosition.topEnd(top: 3, end: 5),
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: h * .03,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    getUserCurrentLocation().then((value) {
                      getAddress(value.latitude, value.longitude);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  icon: Icon(Icons.menu))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hii Suraj, ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: h * .02,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: _getGreeting(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: h * .02,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * .02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Container(
                  height: h * .06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      Text(
                        "Search dishes,restaurant",
                        style: TextStyle(fontSize: h * .02),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * .02 / 1.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showdialogBox(h);
                    },
                    child: Text(
                      "All Categories",
                      style: TextStyle(
                          fontSize: h * .02, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "See All ",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: h * .02,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h * .02 / 1.5,
              ),
              //show the food image
              FoodImage(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Open Restaurants",
                    style: TextStyle(
                        fontSize: h * .03 / 1.3, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        "See All ",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: h * .02,
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: h * .02,
              ),
              Container(
                height: h * .2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: h * .01,
              ),
              Text(
                'Rose Garden Restuarant',
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: h * .03 / 1.3,
                    fontWeight: FontWeight.w600),
              ),

              Text(
                'Burger - Chicken - Riche - wings',
                style: TextStyle(
                    fontSize: h * .02 / 1.1, fontWeight: FontWeight.w300),
              ),

              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        color: Colors.orange,
                        size: h * .04,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "4.7",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fire_truck,
                        color: Colors.orange,
                        size: h * .04,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        size: h * .04,
                        Icons.punch_clock_rounded,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "20 min",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(
                height: h * .02,
              ),
              Container(
                height: h * .2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: h * .01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
