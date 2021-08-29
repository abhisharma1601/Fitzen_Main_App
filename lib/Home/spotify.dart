import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Spotify extends StatefulWidget {
  @override
  _SpotifyState createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          "Music",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                try {
                  launch(
                      "https://open.spotify.com/user/9wluvk318yf4fk74xbb4exdoi/playlist/5hAInJ0EZ8CZ6clEJ94fHe?si=um6-iqGSRo2WI-5_ZFVtkA");
                } catch (e) {
                  Fluttertoast.showToast(msg: "Unable to Launch!");
                }
              },
              child: Container(
                height: 150,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    //border: Border.all(color: Color(0xff155E63),),
                    image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage("Assets/images/Metal.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  launch(
                      "https://open.spotify.com/user/9wluvk318yf4fk74xbb4exdoi/playlist/3JbX7wPQczF69V5kzY0ip5?si=6Zppu3z3S5C7wlI3zkv5SQ");
                } catch (e) {
                  Fluttertoast.showToast(msg: "Unable to Launch!");
                }
              },
              child: Container(
                height: 150,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    //border: Border.all(color: Color(0xff155E63),),
                    image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage("Assets/images/pop.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  launch(
                      "https://open.spotify.com/user/9wluvk318yf4fk74xbb4exdoi/playlist/53IH5P8RBQeWchb8Ql3oKQ?si=G3b9uWnZRFmbbcCPknIl3Q");
                } catch (e) {
                  Fluttertoast.showToast(msg: "Unable to Launch!");
                }
              },
              child: Container(
                height: 150,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    //border: Border.all(color: Color(0xff155E63),),
                    image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage("Assets/images/pun.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
