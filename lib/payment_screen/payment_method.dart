import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:foodcourier/payment_screen/congratulation.dart';

import 'add_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final List<Map<String, String>> _items = [];

  void _navigateToInputPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPayMentMethod()),
    );

    if (result != null &&
        result['title'].isNotEmpty &&
        result['subtitle'].isNotEmpty) {
      setState(() {
        _items.add(result);
      });
    }
  }

  int selectedIndex = -1; // Track the selected button

  @override
  Widget build(BuildContext context) {
    print(_items);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Example list of payment methods
    List<String> paymentMethods = ['Cash', 'Credit Card', 'Paypal'];

    List<String> image = [
      'https://img.icons8.com/?size=48&id=22539&format=png',
      "https://img.icons8.com/?size=80&id=4gtWzsADvpvm&format=png",
      "https://img.icons8.com/?size=48&id=13611&format=png"
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(paymentMethods.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update the selected index
                    });
                  },
                  child: Column(
                    children: [
                      badges.Badge(
                        showBadge: selectedIndex == index,
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.circle,
                          badgeColor: Colors.orange,
                          padding: const EdgeInsets.all(5),
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                        position: badges.BadgePosition.topEnd(top: -5, end: -4),
                        badgeContent: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: h * .02,
                        ),
                        child: Container(
                          height: h * .1 / 1.4,
                          width: w * .3 / 1.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: selectedIndex == index
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.network(
                              height: h * .01 / 1.3, image[index]),
                        ),
                      ),
                      Text(
                        paymentMethods[index],
                        style: TextStyle(
                          fontSize: h * .02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(
              height: h * .02,
            ),
            Container(
              child: _items.isEmpty
                  ? Container(
                      height: h * .3,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: h * .2 / 1.4,
                            width: w * .6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent),
                            child: Image.network(
                                height: h * .1,
                                'https://ouch-cdn2.icons8.com/OZXRd9l_iPNyYWP-e4By0PBu-_McmWno5WASH2d-jNg/rs:fit:368:278/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTA4/Lzg4MWNjZmNiLTA1/YmUtNDEyYi1iY2I1/LWI0MDhlOGRjMzc3/Yy5wbmc.png'),
                          ),
                          SizedBox(
                            height: h * .01,
                          ),
                          Text(
                            "No credit card added",
                            style: TextStyle(
                                fontSize: h * .03 / 1.5,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "You can add a credit card and \nsave it for a latter",
                            style: TextStyle(
                                fontSize: h * .03 / 1.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      flex: 3,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                                'https://img.icons8.com/?size=80&id=4gtWzsADvpvm&format=png'),
                            title: Text(_items[index]['title'] ?? ''),
                            subtitle: Text(_items[index]['subtitle'] ?? ''),
                          );
                        },
                      ),
                    ),
            ),
            SizedBox(
              height: h * .02,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: h * .04,
                width: double.infinity,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      _navigateToInputPage(context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.orange,
                    ),
                    label: Text(
                      'ADD NEW',
                      style: TextStyle(
                        fontSize: h * .02,
                        color: Colors.orange,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: h * .08,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'TOTAL:',
                            style: TextStyle(
                                fontSize: h * .03 / 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: h * .01,
                          ),
                          Text(
                            '\$60',
                            style: TextStyle(
                                fontSize: h * .05 / 1.2,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  SizedBox(
                    height: h * .1 / 1.4,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.orange),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Congratulation()));
                        },
                        child: Text(
                          "PAY & CONFIRM",
                          style: TextStyle(
                              color: Colors.white, fontSize: h * .03 / 1.5),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
