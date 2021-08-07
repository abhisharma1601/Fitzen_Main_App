import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/anexercise.dart';
import 'package:Fitzen/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class pre_Part_exe extends StatefulWidget {
  pre_Part_exe({this.id, this.day});
  String id, day;
  @override
  _pre_Part_exeState createState() => _pre_Part_exeState();
}

class _pre_Part_exeState extends State<pre_Part_exe> {
  @override
  void initState() {
    super.initState();
    print(widget.id);
    print(widget.day);
    getexe();
  }

  Future<void> getexe() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    var snap = await FirebaseFirestore.instance
        .collection("Pre_Plans")
        .doc(widget.id)
        .collection(widget.day)
        .get();
    for (var i in snap.docs) {
      ex.add(
        an_exe(
          name: i.data()["Name"],
          link: i.data()["Link"],
          disc: i.data()["Disc"],
        ),
      );
    }
    setState(() {});
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
  }

  List<an_exe> ex = [];

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
            widget.day,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Wrap(
                  children: ex.length != 0
                      ? ex
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
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class an_exe extends StatelessWidget {
  an_exe({this.link, this.name, this.disc});
  String link, name, disc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ade.getad();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => An_Exercise(
                      name: name,
                      disc: disc,
                      link: link,
                      addds: ade.checkforad(),
                    )));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
            width: 100.00.w,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 55.5,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(link),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FittedBox(
                      child: Center(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
