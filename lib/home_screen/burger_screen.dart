import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/food_details.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  final foodName = [
    "Burger Bistro",
    "Smoking Burger",
    "Bufflo Burger",
    "Bullseye Burger"
  ];
  final restaurantName = [
    "Rose Gargen",
    "Cafenia Restaurant",
    "Kaji Firm kitchen",
    "Kabab Restaurant"
  ];

  final price = ["10", "35", "30", "200"];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade400,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade400,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                  ),
                ))
          ],
          title: Container(
            height: h * .05,
            width: w * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BURGER",
                  style: TextStyle(fontSize: h * .02),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular Burgers",
                  style: TextStyle(
                      fontSize: h * .03 / 1.2, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: h * .01,
                ),
                SizedBox(
                  height: h * .5,
                  width: w,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 40,
                                childAspectRatio: 1 / 1.1,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDetails(
                                            foodName: foodName[index],
                                            price: price[index],
                                            restaurantName:
                                                restaurantName[index],
                                          )));
                            },
                            child: Container(
                              height: h * .3 / 1.3,
                              width: w * .4 / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(.2)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: h * .1,
                                      width: w * .4 / 1.3,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Text(
                                      foodName[index],
                                      style: TextStyle(
                                          fontSize: h * .02 / 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(restaurantName[index]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$" + "${price[index]}",
                                          style: TextStyle(
                                              fontSize: h * .02 / 1.2,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: h * .03 / 1.1,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Text(
                  "Open Resturant",
                  style: TextStyle(
                      fontSize: h * .03 / 1.2, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Container(
                  height: h * .2 / 1.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Text(
                  'Tasty Treat Gallery',
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
              ],
            ),
          ),
        ));
  }
}
