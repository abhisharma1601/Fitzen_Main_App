import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class coronadata extends StatefulWidget {
  @override
  coronadataState createState() => coronadataState();
}

class coronadataState extends State<coronadata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          "Corona Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WebView(
        initialUrl:
            'https://news.google.com/covid19/map?hl=en-IN&gl=IN&ceid=IN%3Aen',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


