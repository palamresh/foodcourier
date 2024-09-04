import 'package:flutter/material.dart';
import 'package:foodcourier/home_screen/home_screen.dart';
import 'package:foodcourier/profile_screen/add_new_address.dart';
import 'package:foodcourier/profile_screen/edit_profile.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Widget _customeList(
      var h, String title, Color color, IconData icon, String subtitle) {
    return ListTile(
      onTap: () {},
      title: Text(title),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          color: color,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.orange,
              ))
        ],
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Address "),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: h * .05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h * .3 / 1.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customeList(
                            h,
                            "Home",
                            Colors.orange,
                            Icons.home_outlined,
                            "33243 Royal Ln Mesa New jersey 45453"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h * .3 / 1.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customeList(h, "Work", Colors.blue, Icons.work_outline,
                            "33243 RanchView California sdf53"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: h * .1 / 1.3,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewAddress()));
                  },
                  child: Text("ADD NEW ADDRESS")),
            ),
          )
        ],
      ),
    );
  }
}
