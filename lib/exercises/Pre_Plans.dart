import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/Pre_Plan_Page.dart';
import 'package:Fitzen/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Pre_Plans extends StatefulWidget {
  @override
  _Pre_PlansState createState() => _Pre_PlansState();
}

class _Pre_PlansState extends State<Pre_Plans> {
  List<Pre_Plan_Wid> ppw = [];

  @override
  void initState() {
    super.initState();
    ade.getad();
    ppwg();
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
  }

  Future<void> ppwg() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    ppw = [];
    var snap = await FirebaseFirestore.instance.collection("Pre_Plans").get();
    for (var i in snap.docs) {
      ppw.add(
        Pre_Plan_Wid(
          name: i.data()["Name"],
          id: i.data()["id"],
        ),
      );
    }
    setState(() {});
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
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            "Pre-Made Plans",
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
                    ],
            ),
            Spacer(),
            ade.checkforad(),
          ],
        ),
      ),
    );
  }
}

class Pre_Plan_Wid extends StatelessWidget {
  Pre_Plan_Wid({this.name, this.id});
  String name, id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Pre_Plan_Page(
                        name: name,
                        id: id,
                      )));
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
