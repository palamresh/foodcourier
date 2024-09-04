import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            )),
        title: Text("Robert Fox"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Bubble(
                  alignment: Alignment.center,
                  color: Color.fromRGBO(212, 234, 244, 1.0),
                  child: Text('TODAY',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11.0)),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  alignment: Alignment.topRight,
                  nipWidth: 8,
                  nipHeight: 24,
                  nip: BubbleNip.rightTop,
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hello, World!', textAlign: TextAlign.right),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  alignment: Alignment.topLeft,
                  nipWidth: 8,
                  nipHeight: 24,
                  nip: BubbleNip.leftTop,
                  child: Text('Hi, developer!'),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  alignment: Alignment.topRight,
                  nipWidth: 30,
                  nipHeight: 10,
                  nip: BubbleNip.rightTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  child: Text('Hello, World!', textAlign: TextAlign.right),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  alignment: Alignment.topLeft,
                  nipWidth: 30,
                  nipHeight: 10,
                  nip: BubbleNip.leftTop,
                  child: Text('Hi, developer!'),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  alignment: Alignment.center,
                  nip: BubbleNip.no,
                  color: Color.fromRGBO(212, 234, 244, 1.0),
                  child: Text('TOMORROW',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11.0)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.face),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.telegram_outlined,
                        color: Colors.orange,
                      )),
                  hintText: "Write something",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
