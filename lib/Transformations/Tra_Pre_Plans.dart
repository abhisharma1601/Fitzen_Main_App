import 'package:Fitzen/exercises/Pre_Plan_exe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tra_Exe.dart';

class Tra_Pre_Plan_Page extends StatefulWidget {
  Tra_Pre_Plan_Page({this.name, this.id, this.id2});
  String name, id, id2;
  @override
  _Tra_Pre_Plan_PageState createState() => _Tra_Pre_Plan_PageState();
}

class _Tra_Pre_Plan_PageState extends State<Tra_Pre_Plan_Page> {
  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            id2: widget.id2,
          ),
          local_wid(
            day: "Tuesday",
            id: widget.id,
            id2: widget.id2,
          ),
          local_wid(
            day: "Wednesday",
            id: widget.id,
            id2: widget.id2,
          ),
          local_wid(
            day: "Thursday",
            id: widget.id,
            id2: widget.id2,
          ),
          local_wid(
            day: "Friday",
            id: widget.id,
            id2: widget.id2,
          ),
          local_wid(
            day: "Saturday",
            id: widget.id,
            id2: widget.id2,
          ),
        ],
      ),
    );
  }
}

class local_wid extends StatelessWidget {
  local_wid({this.day, this.id, this.id2});
  String day, id, id2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => tra_Part_exe(id: id, day: day, id2: id2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey,
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
