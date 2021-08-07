import 'package:Fitzen/Chat/Chat_Screen.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/exercises/Pre_Plan_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'Tra_Pre_Plans.dart';

class Tra_weeks extends StatefulWidget {
  Tra_weeks({@required this.id});
  String id;
  @override
  _Tra_weeksState createState() => _Tra_weeksState();
}

class _Tra_weeksState extends State<Tra_weeks> {
  List<Pre_Plan_Wid> ppw = [];

  @override
  void initState() {
    super.initState();
    print(widget.id);
    ppwg();
  }

  Future<void> ppwg() async {
    ppw = [];
    var snap = await FirebaseFirestore.instance
        .collection("Transformation_Plans")
        .doc(widget.id)
        .collection("Exes")
        .get();
    for (var i in snap.docs) {
      ppw.add(
        Pre_Plan_Wid(
          name: i.data()["Name"],
          id: i.data()["id"],
          id22: widget.id,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chat_Screen(id:widget.id)));
        },
        backgroundColor: Colors.grey.withOpacity(0.5),
        child: CircleAvatar(
          backgroundColor: Color(0xff155E63),
          child: Center(
              child: Icon(
            Icons.question_answer,
            color: Colors.white,
          )),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          "Weekly Exercises",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: ppw.length != 0
                ? ppw
                : [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                      child: Icon(
                                    Icons.fitness_center_outlined,
                                    size: 35,
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      "Loading",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
          ),
        ],
      ),
    );
  }
}

class Pre_Plan_Wid extends StatelessWidget {
  Pre_Plan_Wid({this.name, this.id, this.id22});
  String name, id, id22;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Tra_Pre_Plan_Page(name: name, id: id, id2: id22)));
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadiusDirectional.circular(5)),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.fitness_center,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
