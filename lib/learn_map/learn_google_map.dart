import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LearnGoogleMap extends StatefulWidget {
  const LearnGoogleMap({super.key});

  @override
  State<LearnGoogleMap> createState() => _LearnGoogleMapState();
}

class _LearnGoogleMapState extends State<LearnGoogleMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> _marker = {};
  List<Marker> _list = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(22.296891799553492, 70.79887416487426),
        infoWindow: InfoWindow(title: "Limda Chowk")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(22.31603848668393, 70.76758139371063),
        infoWindow: InfoWindow(title: "Shital Park"))
  ];
  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(22.151111981063693, 70.79626938119063),
      zoom: 19.151926040649414);

  @override
  void initState() {
    for (int i = 1; i < point.length; i++) {
      _marker.add(Marker(
        markerId: MarkerId(i.toString()),
        position: point[i],
      ));
      setState(() {});
    }
    _polygon.add(Polygon(polygonId: PolygonId("2"), points: point));
    // TODO: implement initState
    super.initState();
  }

  Set<Polygon> _polygon = HashSet<Polygon>();
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, trackError) {});

    return await Geolocator.getCurrentPosition();
  }

  List<LatLng> point = [
    LatLng(22.296891799553492, 70.79887416487426),
    LatLng(22.151111981063693, 70.79626938119063),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});

          getUserCurrentLocation().then((value) async {
            GoogleMapController controller = await _controller.future;
            _marker.add(Marker(
                markerId: MarkerId('3'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: "My Current Location")));
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    zoom: 14,
                    target: LatLng(value.latitude, value.longitude))));
            print(value.latitude.toString() + "," + value.longitude.toString());
          });
          // GoogleMapController controller = await _controller.future;
          // controller.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //       zoom: 14,
          //         target: LatLng(22.31603848668393, 70.76758139371063))));
        },
        child: Icon(Icons.location_disabled_outlined),
      ),
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        polygons: _polygon,
        markers: _marker,
        initialCameraPosition: _kLake,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
