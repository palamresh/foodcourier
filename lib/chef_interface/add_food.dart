import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddFood extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  bool _isCheck = true;
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
          "Add New Items",
          style: TextStyle(fontSize: h * .03 / 1.3),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "RESET",
                style: TextStyle(
                  fontSize: h * .02,
                  color: Colors.orange,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * .01,
              ),
              Text(
                "ITEM NAME",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "Mazalichicken Halim",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              Text(
                "UPLOAD PHOTO/VIDEO",
                style:
                    TextStyle(fontSize: h * .03, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: h * .2 / 1.2,
                    width: w / 4,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 162, 184, 223),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: h * .2 / 1.2,
                    width: w / 4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cloud_upload_outlined)),
                        ),
                        Text("Add")
                      ],
                    ),
                  ),
                  Container(
                    height: h * .2 / 1.2,
                    width: w / 4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cloud_upload_outlined)),
                        ),
                        Text("Add")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                "Price",
                style:
                    TextStyle(fontSize: h * .03, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "\$50",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: h * .06,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        checkColor: Colors.white,
                        focusColor: Colors.orange,
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .orange; // Color when the checkbox is selected
                          }
                          return null;
                          // Color when the checkbox is not selected
                        }),
                        side: BorderSide(color: Colors.orange),
                        value: _isCheck,
                        onChanged: (value) {
                          setState(() {
                            _isCheck = value!;
                          });
                        },
                      ),
                      Text("Pick Up")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        checkColor: Colors.orange,
                        focusColor: Colors.orange,
                        side: BorderSide(color: Colors.orange),
                        value: false,
                        onChanged: (value) {
                          setState(() {
                            _isCheck = value!;
                          });
                        },
                      ),
                      Text("Delivery")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                "INGRIDENTS",
                style:
                    TextStyle(fontSize: h * .02, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Basic",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: h * .03 / 1.3, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
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
              Text(
                "Fruits",
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
              SizedBox(
                  height: h * .1 / 1.2,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Text(
                        "SAVE CHANGE",
                        style: TextStyle(
                            fontSize: h * .03 / 1.3, color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
