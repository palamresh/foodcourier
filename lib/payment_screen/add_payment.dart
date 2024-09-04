import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPayMentMethod extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel,
              size: h * .03,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Add Card'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CARD HOLDER NAME",
                style: TextStyle(
                    fontSize: h * .03 / 1.5,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "SURAJ YADAV",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: h * .03,
              ),
              Text(
                "CARD NUMBER",
                style: TextStyle(
                    fontSize: h * .03 / 1.5,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: h * .02 / 1.2,
              ),
              TextFormField(
                controller: _subtitleController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(letterSpacing: 5),
                    fillColor: Colors.grey.shade300,
                    hintText: "1234 ---- ----",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXPIRE DATE",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: h * .02 / 1.2,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              hintText: "mm/yyyy",
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: h * .04,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CVC",
                          style: TextStyle(
                              fontSize: h * .03 / 1.5,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: h * .02 / 1.2,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              hintText: "-----",
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
              SizedBox(
                height: h * .07,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.pop(context, {
                      "title": _titleController.text,
                      "subtitle": _subtitleController.text,
                    });
                  },
                  child: Text(
                    'ADD & MAKE PAYMENT',
                    style: TextStyle(fontSize: h * .02),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
