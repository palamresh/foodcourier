import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'burger_screen.dart';

class RestaurantView extends StatefulWidget {
  final String restaurantName;
  RestaurantView({required this.restaurantName});
  @override
  _RestaurantViewState createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
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
  int activeIndex = 0;
  int currentIndex = -1;

  void changeButtonColor(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final CarouselSliderController _controller = CarouselSliderController();

  _searchkeyword(var h, var w, String title, Widget routes, int index) {
    return InkWell(
      onTap: () {
        changeButtonColor(index);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: h * .05,
        width: w * .3 / 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                currentIndex == index ? Colors.orange : Colors.grey.shade300),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: h * .02, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  final List<String> images = [
    'https://via.placeholder.com/600x400/FF0000/FFFFFF?text=Image+1',
    'https://via.placeholder.com/600x400/00FF00/FFFFFF?text=Image+2',
    'https://via.placeholder.com/600x400/000FF0/FFFFFF?text=Image+3',
    'https://via.placeholder.com/600x400/0F0FF0/FFFFFF?text=Image+4',
    'https://via.placeholder.com/600x400/00F0FF/FFFFFF?text=Image+5',
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade200),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 150,
                      // enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 30, left: w / 2 / 1.2, child: buildIndicator()),
                ],
              ),
              SizedBox(height: 16),
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
                height: h * .02,
              ),
              Text(
                widget.restaurantName,
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                textAlign: TextAlign.justify,
                "Indulge in our mouthwatering burger, crafted with a juicy, flame-grilled beef patty nestled in a freshly toasted bun. Topped with crisp lettuce, ripe tomatoes, crunchy pickles, and melted cheese, each bite delivers a burst of flavor.",
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _searchkeyword(h, w, "Burger", BurgerScreen(), 0),
                    _searchkeyword(h, w, "Sandwich", BurgerScreen(), 1),
                    _searchkeyword(h, w, "Pizza", BurgerScreen(), 2),
                    _searchkeyword(h, w, "Sandwich", BurgerScreen(), 3),
                  ],
                ),
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                "Burger(${foodName.length})",
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: h * .02,
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FoodDetails(
                            //               foodName: foodName[index],
                            //               price: price[index],
                            //               restaurantName:
                            //                   restaurantName[index],
                            //             )));
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blueAccent,
        ),
        onDotClicked: (index) => _controller.animateToPage(index),
      );
}
