import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/Pre_Plan_exe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../main.dart';

class Pre_Plan_Page extends StatefulWidget {
  Pre_Plan_Page({this.name, this.id});
  String name, id;
  @override
  _Pre_Plan_PageState createState() => _Pre_Plan_PageState();
}

class _Pre_Plan_PageState extends State<Pre_Plan_Page> {
  @override
  void initState() {
    ade.getad();
    super.initState();
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
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
            widget.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            local_wid(
              day: "Monday",
              id: widget.id,
            ),
            local_wid(
              day: "Tuesday",
              id: widget.id,
            ),
            local_wid(
              day: "Wednesday",
              id: widget.id,
            ),
            local_wid(
              day: "Thursday",
              id: widget.id,
            ),
            local_wid(
              day: "Friday",
              id: widget.id,
            ),
            local_wid(
              day: "Saturday",
              id: widget.id,
            ),
            Spacer(),
            ade.checkforad()
          ],
        ),
      ),
    );
  }
}

class local_wid extends StatelessWidget {
  local_wid({this.day, this.id});
  String day, id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => pre_Part_exe(
                      id: id,
                      day: day,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadiusDirectional.circular(5)),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                day,
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
