import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class An_Exercise extends StatefulWidget {
  An_Exercise({this.name, this.link, this.disc, @required this.addds});
  String name, link, disc;
  Widget addds;
  @override
  _An_ExerciseState createState() => _An_ExerciseState();
}

class _An_ExerciseState extends State<An_Exercise> {
  String day = "Monday";
  String plan = "Select";
  

  List<DropdownMenuItem<dynamic>> plans = [];

  Future<void> plan_fetch() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
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
    ade.getad();
  
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
    super.initState();
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
  }

  Dialog go() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 230,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "Select Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 9),
                    padding: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Plan',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  DropdownButton<dynamic>(
                      value: plan,
                      iconEnabledColor: Colors.black,
                      items: plans,
                      onChanged: (value) {
                        setState(() {
                          plan = value;
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return go();
                              });
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 9),
                    padding: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Day',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  DropdownButton(
                      iconEnabledColor: Colors.black,
                      value: day,
                      items: [
                        DropdownMenuItem(
                            child: Text("Monday"), value: "Monday"),
                        DropdownMenuItem(
                            child: Text("Tuesday"), value: "Tuesday"),
                        DropdownMenuItem(
                            child: Text("Wednesday"), value: "Wednesday"),
                        DropdownMenuItem(
                            child: Text("Thursday"), value: "Thursday"),
                        DropdownMenuItem(
                            child: Text("Friday"), value: "Friday"),
                        DropdownMenuItem(
                            child: Text("Saturday"), value: "Saturday"),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          day = value;
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return go();
                              });
                        });
                      })
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(cru.getuid())
                        .collection("Custom_Plans")
                        .doc(plan)
                        .collection(day)
                        .doc(DateTime.now().toString())
                        .set({
                      "Name": widget.name,
                      "Disc": widget.disc,
                      "Link": widget.link,
                    });
                  });
                  exadded();
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.navigate_next_sharp,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return go();
                });
          },
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Color(0xff155E63),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
            )),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
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
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(widget.disc,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal)),
                        SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
              widget.addds
            ],
          ),
        ),
      ),
    );
  }
}
