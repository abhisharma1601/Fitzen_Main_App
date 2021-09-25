import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Daily_Post extends StatefulWidget {
  Daily_Post({@required this.url});
  String url;
  @override
  _Daily_PostState createState() => _Daily_PostState();
}

class _Daily_PostState extends State<Daily_Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          "Daily Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Image(
              image: NetworkImage(widget.url),
            ),
          ),
        ],
      ),
    );
  }
}
