import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade200,
                      ),
                      Container(
                        height: h * .3 / 1.2,
                        width: w / 1 / 1.3,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(date.day.toString() +
                                      "/" +
                                      date.month.toString() +
                                      "/" +
                                      date.year.toString()),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              Text(
                                "Great Food Services",
                                style: TextStyle(fontSize: h * .02),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h * .02,
                              ),
                              Text(
                                  "Traditional sit-down restaurants offering a variety of cuisines where customers order from a menu and are served at their table."),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
