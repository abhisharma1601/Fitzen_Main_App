import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class anexe extends StatefulWidget {
  anexe({this.name, this.link, this.disc, this.sets});
  String name, link, disc, sets;
  @override
  _anexeState createState() => _anexeState();
}

class _anexeState extends State<anexe> {
  String day = "Monday";
  String plan = "Select";

  List<DropdownMenuItem<dynamic>> plans = [];

  Future<void> plan_fetch() async {
    plans = [];
    var snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(cru.getuid())
        .collection("Custom_Plans")
        .get();
    for (var i in snap.docs) {
      plans.add(DropdownMenuItem(
        child: Text(i.data()["Name"]),
        value: i.data()["Name"],
      ));
    }
    plans.add(
      DropdownMenuItem(
        child: Text("Select"),
        value: "Select",
      ),
    );
  }

  @override
  void initState() {
    plan_fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.3)),
                ),
                child: Image(
                  width: 100.0.w,
                  image: NetworkImage(widget.link),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(widget.disc,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Performing Sets",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.sets,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
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
