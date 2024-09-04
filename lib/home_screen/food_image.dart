import 'package:flutter/material.dart';

class FoodImage extends StatefulWidget {
  const FoodImage({super.key});

  @override
  State<FoodImage> createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  final Image = [];
  final price = ["10", "20", "50", "200"];
  final foodName = ["Pizza", "Burger", "Pizza", "Pizza"];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * .4 / 1.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            height: h * .2 / 1.1,
            width: w * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey.shade200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * .2 / 1.1,
                  width: w * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    foodName[index],
                    style: TextStyle(
                        fontSize: h * .03 / 1.2, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: h * .01 / 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starting",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$" + "${price[index]}",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
