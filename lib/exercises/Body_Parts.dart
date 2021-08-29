import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/Part_exercises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class Body_Parts extends StatefulWidget {
  Body_Parts({@required this.appbar});
  bool appbar;
  @override
  _Body_PartsState createState() => _Body_PartsState();
}

class _Body_PartsState extends State<Body_Parts> {
  @override
  void initState() {
    super.initState();
    getbp();
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
  }

  Future<void> getbp() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    bp = [];
    var snap = await FirebaseFirestore.instance.collection("Exercises").get();
    for (var i in snap.docs) {
      bp.add(BodyPart_Wid(
        name: i.data()["Name"],
      ));
    }
    setState(() {});
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
  }

  List<BodyPart_Wid> bp = [];

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        appBar: widget.appbar ? AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            "Exercises",
            style: TextStyle(color: Colors.white),
          ),
        ):AppBar(toolbarHeight: 0,),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 5),
            Center(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: bp.length != 0
                      ? bp
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                        ]),
            ),
            SizedBox(height: 10),
          ],
        )),
      ),
    );
  }
}

class BodyPart_Wid extends StatelessWidget {
  BodyPart_Wid({this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Part_exe(
                      name: name,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 26.0.h,
        width: 44.44.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/images/$name.jpg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
