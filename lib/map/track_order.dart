import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodcourier/map/my_order.dart';
import 'package:foodcourier/map/track_food.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
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
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TrackFood()));
        },
        child: Container(
          height: h * .2 / 1.2,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                          fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Order At 06 sept 10:00pm",
                      style: TextStyle(
                          fontSize: h * .02 / 1.2, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "4x Sandwich",
                      style: TextStyle(
                          fontSize: h * .02 / 1.2, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "2x Burger",
                      style: TextStyle(
                          fontSize: h * .02 / 1.2, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Track Order"),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrder()));
              },
              child: Text(
                "My Order",
                style: TextStyle(color: Colors.white),
              ))
        ],
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
