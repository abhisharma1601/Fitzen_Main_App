import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/Part_exercises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

import 'Add_Part_Exe.dart';

class Add_Body_Exe extends StatefulWidget {
  Add_Body_Exe({this.id, this.day});
  String day, id;
  @override
  _Add_Body_ExeState createState() => _Add_Body_ExeState();
}

class _Add_Body_ExeState extends State<Add_Body_Exe> {
  @override
  void initState() {
    super.initState();
    getbp();
  }

  Future<void> getbp() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    bp = [];
    var snap = await FirebaseFirestore.instance.collection("Exercises").get();
    for (var i in snap.docs) {
      bp.add(BodyPart_Wid(
        name: i.data()["Name"],
        id: widget.id,
        day: widget.day,
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
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            "Exercises",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 5),
            Center(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center, children: bp),
            ),
            SizedBox(height: 10)
          ],
        )),
      ),
    );
  }
}

class BodyPart_Wid extends StatelessWidget {
  BodyPart_Wid({this.name,this.id,this.day});
  String name,id,day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Add_Part_exe(
                      name: name,
                      id: id,
                      day: day,
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
