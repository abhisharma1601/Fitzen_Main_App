import 'package:Fitzen/Login/home_screen.dart';
import 'package:Fitzen/Screens/LogBook.dart';
import 'package:Fitzen/Transformations/MainPage.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/exercises/Custom_Plans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const String testDevice = "mobile_id";

class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 5.0.h),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Container(
            height: 25.0.h,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage("Assets/images/ps.jpg"), fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(height: 1.0.h),
        Padding(
          padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
          child: GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Custom_Plans(),
                ),
              );
            },
            child: Drawer_wig(
              icon: Icons.copy,
              text: "My Plans",
              color: Color(0xffDD1C1A),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
            child: GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TMP(
                      showappbar: true,
                    ),
                  ),
                );
              },
              child: Drawer_wig(
                  icon: Icons.fitness_center,
                  text: "Trainings",
                  color: Color(0xff4A001F)),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogBook(
                      showappbar: true,
                    ),
                  ),
                );
              },
              child: Drawer_wig(
                  icon: Icons.save, text: "Logs", color: Color(0xff003459)),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
            child: GestureDetector(
              onTap: () {
                soon();
              },
              child: Drawer_wig(
                  icon: Icons.shopping_cart,
                  text: "Store",
                  color: Color(0xff494947)),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
            child: GestureDetector(
              onTap: () {},
              child: Drawer_wig(
                  icon: Icons.book, text: "Blogs", color: Color(0xff69140E)),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(3.0.w, 2.0.h, 4.0.w, 1.5.h),
          child: GestureDetector(
            child: GestureDetector(
              onTap: () {},
              child: Drawer_wig(
                  icon: Icons.share, text: "Share", color: Color(0xff231C07)),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Home_Screen()));
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(29.44.w, 0, 29.44.w, 3.6.h),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 28,
                  color: Color(0xff155E63),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Drawer_wig extends StatelessWidget {
  Drawer_wig({this.icon, this.text, this.color});
  IconData icon;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 3,
        ),
        Icon(
          icon,
          size: 21,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
