import 'package:Fitzen/Payment_Gateway/PaymentPage.dart';
import 'package:Fitzen/Transformations/Tra_Weeks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class TMP extends StatefulWidget {
  TMP({@required this.showappbar});
  bool showappbar;
  @override
  _TMPState createState() => _TMPState();
}

class _TMPState extends State<TMP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showappbar ? AppBar(
        title: Text(
          "Transformation Plans",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff155E63),
      ):AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                var snap = await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cru.getuid())
                    .get();
                if (snap.data()["Bought"]["0"]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tra_weeks(
                        id: "0",
                      ),
                    ),
                  );
                } else if (!snap.data()["Bought"]["0"]) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 380,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "Body Building Plan",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Transformation Plan is paid (199/-).',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Plan will offer you advance exercises with Sets and reps.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Also you will be able to ask 5 questions related to fitness through app.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Ads Removed !',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => py_pg(
                                          id: "0",
                                          amount: "19900",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              child: Container(
                height: 170,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var snap = await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cru.getuid())
                    .get();
                if (snap.data()["Bought"]["1"]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tra_weeks(
                              id: "1",
                            )),
                  );
                } else if (!snap.data()["Bought"]["1"]) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 380,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "Weight Loss Plan",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Transformation Plan is paid (199/-).',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Plan will offer you advance exercises with Sets and reps.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Also you will be able to ask 5 questions related to fitness through app.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Ads Removed !',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => py_pg(
                                                id: "1",
                                                amount: "19900",
                                              )),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              child: Container(
                height: 185,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/2.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var snap = await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cru.getuid())
                    .get();
                if (snap.data()["Bought"]["2"]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tra_weeks(
                              id: "2",
                            )),
                  );
                } else if (!snap.data()["Bought"]["2"]) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 380,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "Abs And Cut",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Transformation Plan is paid (199/-).',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Plan will offer you advance exercises with Sets and reps.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Also you will be able to ask 5 questions related to fitness through app.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Ads Removed !',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => py_pg(
                                                id: "2",
                                                amount: "19900",
                                              )),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              child: Container(
                height: 185,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/3.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var snap = await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cru.getuid())
                    .get();
                if (snap.data()["Bought"]["3"]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tra_weeks(
                              id: "3",
                            )),
                  );
                } else if (!snap.data()["Bought"]["3"]) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 380,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "Strength Gain Plan",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Transformation Plan is paid (199/-).',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'This Plan will offer you advance exercises with Sets and reps.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Also you will be able to ask 5 questions related to fitness through app.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    new ListTile(
                                      leading: Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: new Text(
                                        'Ads Removed !',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => py_pg(
                                                id: "3",
                                                amount: "19900",
                                              )),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              child: Container(
                height: 185,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/4.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
