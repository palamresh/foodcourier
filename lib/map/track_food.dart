import 'dart:async';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodcourier/map/chat.dart';
import 'package:foodcourier/map/delivery_man_call.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackFood extends StatefulWidget {
  const TrackFood({super.key});

  @override
  State<TrackFood> createState() => _TrackFoodState();
}

class _TrackFoodState extends State<TrackFood> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  final dashImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
  ];

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> _marker = {};
  Set<Polyline> _polyline = {};

  List<LatLng> latLan = [
    LatLng(22.29572086838071, 70.80020424690716),
    LatLng(22.31588, 70.76782),
  ];

  Completer<GoogleMapController> _controler = Completer();
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < latLan.length; i++) {
      _marker.add(Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId(i.toString()),
          position: latLan[i]));

      setState(() {});
    }

    _polyline.add(Polyline(
        color: Colors.orange, polylineId: PolylineId('1'), points: latLan));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: h * .6,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: h * .1,
                          width: w / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://tse1.mm.bing.net/th?id=OIP.fLdQYOwsdDjYj3ldtcyBVAHaE8&pid=Api&P=0&h=220'))),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uttra Coffee House",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Order At 06 sept 10:00pm",
                          style: TextStyle(
                              fontSize: h * .02 / 1.2,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "4x Sandwich",
                          style: TextStyle(
                              fontSize: h * .02 / 1.2,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "2x Burger",
                          style: TextStyle(
                              fontSize: h * .02 / 1.2,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: h * .02,
                ),
                Text(
                  "20 min",
                  style: TextStyle(
                      fontSize: h * .03 / 1.2, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Text(
                  "ESTIMATED DELIVERY TIME",
                  style: TextStyle(
                      fontSize: h * .02 / 1.2, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: h * .02,
                ),
                EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    lineLength: 50,
                    lineType: LineType.normal,
                    lineThickness: 3,
                    lineSpace: 0,
                    lineWidth: 1,
                    unreachedLineType: LineType.dashed,
                  ),
                  stepShape: StepShape.rRectangle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  internalPadding: 10,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  stepRadius: 28,
                  finishedStepBorderColor: Colors.deepOrange,
                  finishedStepTextColor: Colors.deepOrange,
                  finishedStepBackgroundColor: Colors.deepOrange,
                  activeStepIconColor: Colors.deepOrange,
                  showLoadingAnimation: false,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 0 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Waiting',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 1 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Order Received',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 2 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Preparing',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 3 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'On Way',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              activeStep >= 4 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Delivered',
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
                Container(
                  height: h * .2 / 1.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://tse4.mm.bing.net/th?id=OIP.vq1yNlaFiDjj9ojwHPS00gHaE7&pid=Api&P=0&h=220'),
                      ),
                      title: Text(
                        "Robert F.",
                        style: TextStyle(
                          fontSize: h * .03 / 1.3,
                        ),
                      ),
                      subtitle: Text(
                        "Courier",
                        style: TextStyle(
                          fontSize: h * .02 / 1.3,
                        ),
                      ),
                      trailing: Container(
                          width: w / 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: h * .03,
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeliveryManCall()));
                                    },
                                    icon: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                radius: h * .03,
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatScreen()));
                                    },
                                    icon: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Track Order"),
      ),
      body: GoogleMap(
          polylines: _polyline,
          markers: _marker,
          myLocationEnabled: true,
          onMapCreated: (controler) {
            _controler.complete(controler);
          },
          initialCameraPosition: _kGooglePlex),
    );
  }
}
