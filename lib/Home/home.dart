import 'package:Fitzen/Home/Post.dart';
import 'package:Fitzen/Home/spotify.dart';
import 'package:Fitzen/Transformations/MainPage.dart';
import 'package:Fitzen/exercises/Body_Parts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../main.dart';

class Home_Page extends StatefulWidget {
  Home_Page(
      {@required this.done,
      @required this.name,
      @required this.quote,
      @required this.url});
  bool done;
  String name;
  String quote;
  String url;
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    if (!widget.done) {
      setdata();
    }
    super.initState();
  }

  void setdata() async {
    var snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(cru.getuid())
        .get();
    widget.name = snap.data()["Data"]["Name"];
    snap = await FirebaseFirestore.instance
        .collection("App_Data")
        .doc("Quote")
        .get();
    widget.quote = snap.data()["val"];
    snap = await FirebaseFirestore.instance
        .collection("App_Data")
        .doc("Post_Image")
        .get();
    widget.url = snap.data()["url"];
    setState(() {
      widget.done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65.2,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          "https://cdn.dribbble.com/users/788099/screenshots/11320844/media/ce5996b9f843835601b6985d7abb5472.png?compress=1&resize=400x300"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                    "Hello, ${widget.name} !",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quote of the day !",
                    style: TextStyle(
                        color: Color(0xff155E63),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.quote,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 51.0.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                            child: Daily_Post(
                          url: widget.url,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 420,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(child: TMP(showappbar: true)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 540,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(child: Spotify()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
