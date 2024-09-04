import 'package:flutter/material.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  Widget ongoingItem(var h, var w, String title, String code, String foodName,
      String item, String price) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .02,
            ),
            Text(
              title,
              style: TextStyle(fontSize: h * .02),
            ),
            SizedBox(
              height: h * .03,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: h * .1,
                width: w / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
              ),
              title: Text(
                foodName,
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w800),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "\$${price}",
                    style: TextStyle(
                        fontSize: h * .02, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 2,
                      height: h * .02,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    item,
                    style: TextStyle(
                        fontSize: h * .02, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              trailing: Text(
                code,
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: h * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: w / 2 / 1.1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Track Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  width: w / 2 / 1.2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.orange),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.orange),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ongoingItem(
                h, w, "Food", "#12324434", "Pizza Hut", "02 Item", "13.35"),
            ongoingItem(
                h, w, "Drink", "#35335434", "McDonald", "03 Item", "33.25"),
            ongoingItem(
                h, w, "StarBucks", "#12324e", "Pizza Hut", "04 Item", "43.35"),
          ],
        ),
      ),
    );
  }
}
