import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:foodcourier/home_screen/burger_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  restaurant(var h, var w, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: h * .07,
        width: w * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.shade300),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.star, color: Colors.orange),
          Text(
            subtitle,
            style: TextStyle(fontSize: h * .02, fontWeight: FontWeight.bold),
          )
        ],
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: h * .02 / 1.1, fontWeight: FontWeight.w500),
      ),
    );
  }

  _searchkeyword(var h, var w, String title, Widget routes) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routes));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: h * .05,
        width: w * .3 / 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: h * .02, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.red,
              padding: const EdgeInsets.all(5),
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.transparent, width: 1),
            ),
            position: badges.BadgePosition.topEnd(top: -3, end: 5),
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: h * .02),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: h * .03,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: h * .02,
                  ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        _searchController.text = "";
                      },
                    ),
                    fillColor: Colors.grey.shade300,
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                'Recent Keywords',
                style: TextStyle(
                    fontSize: h * .03 / 1.4, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _searchkeyword(h, w, "Burger", BurgerScreen()),
                    _searchkeyword(h, w, "Sandwich", BurgerScreen()),
                    _searchkeyword(h, w, "Pizza", BurgerScreen()),
                    _searchkeyword(h, w, "Sandwich", BurgerScreen()),
                  ],
                ),
              ),
              SizedBox(
                height: h * .02,
              ),
              Text(
                'Suggested Restaurant',
                style: TextStyle(
                    fontSize: h * .03 / 1.4, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .03,
              ),
              restaurant(h, w, "Popular Restaurant", "4.7"),
              restaurant(h, w, "American spicy Burger shop", "4.3"),
              restaurant(h, w, "Caferio Coffee Club", "4.0"),
              SizedBox(
                height: h * .04,
              ),
              Text(
                'Popular Fast Food',
                style: TextStyle(
                    fontSize: h * .03 / 1.4, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: h * .2,
                    width: w * .4 / 1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey.withOpacity(.1)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(14),
                          height: h * .1,
                          width: w * .4 / 1.3,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Text(
                          "Europeon Pizza",
                          style: TextStyle(
                              fontSize: h * .02 / 1.2,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("Uttar coffee house")
                      ],
                    ),
                  ),
                  Container(
                    height: h * .2,
                    width: w * .4 / 1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey.withOpacity(.1)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(14),
                          height: h * .1,
                          width: w * .4 / 1.3,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Text(
                          "Buffalo Pizza",
                          style: TextStyle(
                              fontSize: h * .02 / 1.2,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("Cofenio coffee club")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
