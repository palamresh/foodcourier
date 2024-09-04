import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();

    // WebViewController को इनिशियलाइज़ करना और आवश्यक सेटिंग्स को लागू करना
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://snehsajawat.jalshachemicals.com'),
      ); // सही तरीके से URL लोड करना
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.reload(); // WebView को रीफ्रेश करने के लिए
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
