import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetail extends StatefulWidget {
  final String restaurantName;
  FoodDetail({required this.restaurantName});
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  final price = ["10", "35", "30", "200"];
  int activeIndex = 0;
  int currentIndex = -1;

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

  final CarouselSliderController _controller = CarouselSliderController();

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
        title: Text(
          "Food Details",
          style: TextStyle(fontSize: h * .03 / 1.3),
        ),
        actions: [
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
                      height: 200,
                      // enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text("Breakfast")),
                            SizedBox(
                              width: h * .04,
                            ),
                            buildIndicator(),
                            SizedBox(
                              width: h * .04,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Delivery")),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: h * .01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurantName,
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "\$60",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        'Kentuckky',
                        style: TextStyle(
                            fontSize: h * .03 / 1.3,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: h * .03,
                            color: Colors.orange,
                          ),
                          Text(
                            "4.9",
                            style: TextStyle(
                                fontSize: h * .03, color: Colors.orange),
                          )
                        ],
                      ),
                      SizedBox(
                        width: h * .02,
                      ),
                      Text(
                        "(10 Reviews)",
                        style: TextStyle(
                          fontSize: h * .02,
                        ),
                      )
                    ],
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
                height: h * .03,
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
              Text(
                "Description",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: const ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blueAccent,
        ),
        onDotClicked: (index) => _controller.animateToPage(index),
      );
}
