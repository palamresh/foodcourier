import 'package:flutter/material.dart';

class AllFoodItem extends StatefulWidget {
  const AllFoodItem({super.key});

  @override
  State<AllFoodItem> createState() => _AllFoodItemState();
}

class _AllFoodItemState extends State<AllFoodItem> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total 03 Items",
              style: TextStyle(fontSize: h * .03 / 1.2),
            ),
            SizedBox(
              height: h * .03,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h * .2 / 1.2,
                          width: w / 3,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Chickain Thai Biriyani",
                                    style: TextStyle(
                                        fontSize: h * .02 / 1.1,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: h * .01,
                                  ),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Breakfast")),
                                  SizedBox(
                                    width: h * .05,
                                  ),
                                  Text(
                                    "\$60",
                                    style: TextStyle(
                                        fontSize: h * .03 / 1.4,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: h * .02,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                            fontSize: h * .02 / 1.2,
                                            color: Colors.orange),
                                      ),
                                      SizedBox(
                                        width: h * .01,
                                      ),
                                      Text(
                                        "(10 Reviews)",
                                        style:
                                            TextStyle(fontSize: h * .02 / 1.3),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: h * .01,
                                  ),
                                  Text(
                                    "Pick up",
                                    style: TextStyle(fontSize: h * .02),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
