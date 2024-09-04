import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertAddress extends StatefulWidget {
  const ConvertAddress({super.key});

  @override
  State<ConvertAddress> createState() => _ConvertAddressState();
}

class _ConvertAddressState extends State<ConvertAddress> {
  String address = '', std = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convert Address"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(address),
            Text(std),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  List<Location> locations =
                      await locationFromAddress("Gronausestraat 710, Enschede");

                  address = locations.last.latitude.toString() +
                      "," +
                      locations.last.longitude.toString();

                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(52.2165157, 6.9437819);
                  std = placemarks.reversed.last.administrativeArea.toString();
                },
                child: Text("convert"))
          ],
        ),
      ),
    );
  }
}
