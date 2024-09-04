import 'package:flutter/material.dart';
import 'package:foodcourier/cart_screen/my_cart.dart';
import 'package:foodcourier/home_screen/restaurant_view.dart';

// ignore: must_be_immutable
class FoodDetails extends StatefulWidget {
  final String foodName;
  final String restaurantName;
  String price;
  FoodDetails(
      {super.key,
      required this.foodName,
      required this.restaurantName,
      required this.price});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int count = 1;
  late int currentPrice;
  late int incrementAmount;

  @override
  void initState() {
    super.initState();
    // Parse the initial price from string to integer
    currentPrice = int.parse(widget.price);
    incrementAmount = currentPrice;
  }

  void increasePrice() {
    setState(() {
      currentPrice += incrementAmount;
    });
  }

  void decreasePrice() {
    setState(() {
      if (currentPrice - incrementAmount >= 0) {
        currentPrice -= incrementAmount;
      } else {
        currentPrice = 0;
      }
    });
  }

  ingridents(var h, var w, String url) {
    return Container(
      height: h * .07,
      width: w * .2 / 1.2,
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(.4),
        shape: BoxShape.circle,
      ),
      child: Center(child: Image.network(height: h * .04, url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: h * .03, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * .01,
              ),
              Stack(
                children: [
                  Container(
                    height: h * .2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * .01,
              ),
              Text(
                widget.foodName,
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: h * .03 / 1.3,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .01,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantView(
                                restaurantName: widget.restaurantName,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Text(
                    widget.restaurantName,
                    style: TextStyle(
                        fontSize: h * .02 / 1.1, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: h * .01,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "4.7",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fire_truck,
                        color: Colors.orange,
                        size: h * .04,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                            fontSize: h * .02, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        size: h * .04,
                        Icons.punch_clock_rounded,
                        color: Colors.orange,
                      ),
                      const SizedBox(
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
                height: h * .01,
              ),
              Text(
                textAlign: TextAlign.justify,
                "Indulge in our mouthwatering burger, crafted with a juicy, flame-grilled beef patty nestled in a freshly toasted bun. Topped with crisp lettuce, ripe tomatoes, crunchy pickles, and melted cheese, each bite delivers a burst of flavor.",
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .01,
              ),
              Row(
                children: [
                  Text(
                    "Size :",
                    style: TextStyle(
                        fontSize: h * .02, fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: h * .07,
                    width: w * .2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "10''",
                        style: TextStyle(fontSize: h * .02),
                      ),
                    ),
                  ),
                  Container(
                    height: h * .07,
                    width: w * .2,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "14''",
                        style:
                            TextStyle(fontSize: h * .02, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: h * .07,
                    width: w * .2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "16''",
                        style: TextStyle(fontSize: h * .02),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "INGRIDENTS",
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ingridents(h, w,
                      'https://img.icons8.com/?size=48&id=Q2fre4pbJjTx&format=png'),
                  ingridents(h, w,
                      'https://img.icons8.com/?size=80&id=OboYxeUzd6L8&format=png'),
                  ingridents(h, w,
                      'https://img.icons8.com/?size=50&id=d1qkFrqBnzjB&format=png'),
                  ingridents(h, w,
                      'https://img.icons8.com/?size=64&id=u77bU8lnnOGG&format=png'),
                  ingridents(h, w,
                      'https://img.icons8.com/?size=48&id=TVawhtUFmKwq&format=png'),
                ],
              ),
              SizedBox(
                height: h * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${currentPrice}",
                    style: TextStyle(
                        fontSize: h * .04, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: h * .05,
                    width: w * .3 / 1.2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count > 1) {
                                count--;
                                decreasePrice();
                              }
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(.4)),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: h * .04 / 1.3,
                              )),
                        ),
                        Text(
                          "${count.toString()}",
                          style:
                              TextStyle(fontSize: h * .03, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                              increasePrice();
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(.6)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: h * .04 / 1.3,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .02,
              ),
              SizedBox(
                height: h * .06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyCart()));
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
