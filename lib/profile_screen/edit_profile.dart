import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 50, end: -5),
                  showBadge: true,
                  ignorePointer: false,
                  onTap: () {},
                  badgeContent: Icon(Icons.edit_outlined,
                      color: Colors.white, size: h * .04),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.orange,
                    padding: EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    elevation: 0,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepOrange.shade200,
                  ),
                ),
              ),
              Text(
                "FULL Name",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "jhon milan",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              Text(
                "EMAIL",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "json@gmail.com",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              Text(
                "PHONE NUMBER",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "253254125",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              Text(
                "BIO",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "I love fast food",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              SizedBox(
                  height: h * .1 / 1.3,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: h * .03 / 1.2, color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
