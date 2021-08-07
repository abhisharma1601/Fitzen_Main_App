import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'Cus_plan_page.dart';
import 'package:Fitzen/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Plans extends StatefulWidget {
  @override
  _Custom_PlansState createState() => _Custom_PlansState();
}

List<Cus_Plan_Wid> ppw = [];
List<Widget> defC = [
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
];
List<Widget> noC = [
  Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.5),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Icon(
            Icons.warning,
            size: 35,
          )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "No Plans created !",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  )
];

class _Custom_PlansState extends State<Custom_Plans> {
  String title;

  @override
  void initState() {
    super.initState();
    ppwg();
  }

  Future<void> ppwg() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    ppw = [];
    var snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(cru.getuid())
        .collection("Custom_Plans")
        .get();
    for (var i in snap.docs) {
      ppw.add(
        Cus_Plan_Wid(
          name: i.data()["Name"],
          id: i.data()["Name"],
          fun: () => {setState(() {})},
        ),
      );
    }
    setState(() {
      if (ppw.length != 0) {
        defC = ppw;
      } else {
        defC = noC;
      }
    });
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
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
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      height: 160,
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
                            "Enter Plan Name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 25, 12, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
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
                                    'Title',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: (text) {
                                        title = text;
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      textAlign: TextAlign.center,
                                      maxLength: 20,
                                      maxLengthEnforced: true,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Enter title",
                                        hintStyle:
                                            TextStyle(color: Color(0xffCBCBCB)),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 6.0),
                                        counter: Offstage(),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(cru.uid)
                                    .collection("Custom_Plans")
                                    .doc(title)
                                    .set(
                                        {"Name": title}, SetOptions(merge: true));
                                ppwg();
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
            "Custom Plans",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: defC,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cus_Plan_Wid extends StatelessWidget {
  Cus_Plan_Wid({this.name, this.id, this.fun});
  String name, id;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cus_Plan_page(
                name: name,
                id: id,
              ),
            ),
          );
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
              InkWell(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection("Users")
                      .doc(cru.getuid())
                      .collection("Custom_Plans")
                      .doc(id)
                      .delete();
                  ppw = [];
                  var snap = await FirebaseFirestore.instance
                      .collection("Users")
                      .doc(cru.getuid())
                      .collection("Custom_Plans")
                      .get();
                  for (var i in snap.docs) {
                    ppw.add(
                      Cus_Plan_Wid(
                        name: i.data()["Name"],
                        id: i.data()["Name"],
                        fun: fun,
                      ),
                    );
                  }
                  if (ppw.length != 0) {
                    defC = ppw;
                  } else {
                    defC = noC;
                  }
                  fun();
                },
                child: Icon(
                  Icons.delete,
                  size: 35,
                ),
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
