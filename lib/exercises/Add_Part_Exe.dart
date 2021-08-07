import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/anexercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class Add_Part_exe extends StatefulWidget {
  Add_Part_exe({this.name, this.id, this.day});
  String name, id, day;
  @override
  _Add_Part_exeState createState() => _Add_Part_exeState();
}

class _Add_Part_exeState extends State<Add_Part_exe> {
  @override
  void initState() {
    super.initState();
    getexe();
  }

  Future<void> getexe() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    var snap = await FirebaseFirestore.instance
        .collection("Exercises")
        .doc(widget.name)
        .collection("Exes")
        .get();
    for (var i in snap.docs) {
      ex.add(
        an_exe(
          name: i.data()["Name"],
          link: i.data()["Link"],
          disc: i.data()["Disc"],
          id: widget.id,
          day: widget.day,
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
            widget.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Wrap(
                  children: ex,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class an_exe extends StatelessWidget {
  an_exe({this.link, this.name, this.disc, this.id, this.day});
  String link, name, disc, id, day;

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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50.5,
                  child: CircleAvatar(
                    radius: 50,
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
              Spacer(),
              GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(cru.getuid())
                        .collection("Custom_Plans")
                        .doc(id)
                        .collection(day)
                        .doc(DateTime.now().toString())
                        .set({
                      "Name": name,
                      "Disc": disc,
                      "Link": link,
                    });
                    exadded();
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 35,
                  )),
              SizedBox(
                width: 20,
              )
            ],
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
