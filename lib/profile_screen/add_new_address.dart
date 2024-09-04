import 'package:flutter/material.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _buttonLabel = ["Home", "Work", "Other"];
  List<Color> color = [
    Colors.orange,
    Colors.grey,
    Colors.grey,
  ];

  _changeColor(int index) {
    color[index] = color[index] == Colors.grey ? Colors.orange : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "Enter Your Address",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "STREET",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: h * .01 / 1.2,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              hintText: "Enter Your Street",
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: h * .03,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "POST CODE",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: h * .01 / 1.2,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              hintText: "24353",
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * .03,
              ),
              Text(
                "APPARTMENT",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "Enter Your Appartment Number",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .03,
              ),
              Text(
                "LABELS",
                style: TextStyle(
                    fontSize: h * .03 / 1.5, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: h * .01 / 1.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(_buttonLabel.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color[index],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          _changeColor(index);
                          setState(() {});
                        },
                        child: Text(
                          _buttonLabel[index],
                          style: TextStyle(color: Colors.white),
                        )),
                  );
                }),
              ),
              SizedBox(
                height: h * .03,
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
                        Navigator.pop(context);
                      },
                      child: Text("Save Location")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
