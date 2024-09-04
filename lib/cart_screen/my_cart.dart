import 'package:flutter/material.dart';
import 'package:foodcourier/cart_screen/edit_cart.dart';
import 'package:foodcourier/payment_screen/payment_method.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: h * .03, color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditCart()));
              },
              child: Text(
                "EDIT ITEMS",
                style: TextStyle(
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.orange,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * .2 / 1.3,
                  width: w / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(.3)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pizza  Calzone \nEuropeon",
                        style: TextStyle(
                            fontSize: h * .03 / 1.3, color: Colors.white),
                      ),
                      SizedBox(
                        height: h * .01 / 1.2,
                      ),
                      Text(
                        "\$30",
                        style: TextStyle(
                            fontSize: h * .03 / 1.3, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "14''",
                            style: TextStyle(
                                fontSize: h * .02, color: Colors.white),
                          ),
                          SizedBox(
                            width: h * .05,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    size: h * .03,
                                    color: Colors.white,
                                  )),
                              Text(
                                "1",
                                style: TextStyle(
                                    fontSize: h * .03 / 1.3,
                                    color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: h * .03,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * .2 / 1.3,
                  width: w / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(.3)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pizza  Calzone \nEuropeon",
                        style: TextStyle(
                            fontSize: h * .03 / 1.3, color: Colors.white),
                      ),
                      SizedBox(
                        height: h * .01 / 1.2,
                      ),
                      Text(
                        "\$90",
                        style: TextStyle(
                            fontSize: h * .03 / 1.3, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "14''",
                            style: TextStyle(
                                fontSize: h * .02, color: Colors.white),
                          ),
                          SizedBox(
                            width: h * .05,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    size: h * .03,
                                    color: Colors.white,
                                  )),
                              Text(
                                "3",
                                style: TextStyle(
                                    fontSize: h * .03 / 1.3,
                                    color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: h * .03,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * .05,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("DELIVERY ADDRESS"),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "EDIT",
                                  style: TextStyle(
                                      fontSize: h * .02,
                                      color: Colors.orange,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: h * .03,
                        ),
                        Container(
                          height: h * .07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '334 Thornigde Cir. Cyracuse',
                              style: TextStyle(fontSize: h * .02),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'TOTAL:',
                                  style: TextStyle(
                                      fontSize: h * .03 / 1.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: h * .01,
                                ),
                                Text(
                                  '\$60',
                                  style: TextStyle(
                                      fontSize: h * .05 / 1.2,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Breakdown",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: h * .03 / 1.5,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * .04,
                        ),
                        SizedBox(
                          height: h * .1 / 1.4,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentMethod()));
                              },
                              child: Text(
                                "PLACE ORDER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: h * .03 / 1.5),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
