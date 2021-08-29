import 'dart:math';

import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:share/share.dart';

import '../main.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {this.bmi,
      this.calories,
      this.calup,
      this.caldown,
      this.bmilist,
      this.fatper,
      this.fat,
      this.muscle});
  double bmi, calories, calup, caldown, fatper, fat, muscle;
  List bmilist;
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
      inAsyncCall: false,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Share.share(
                'BMI : ${widget.bmi}\nFat Percentage : ${widget.fatper}% \nCalories to gain weight : ${widget.calup} \nCalories to loose weight : ${widget.caldown}');
          },
          child: Center(
            child: Icon(
              Icons.send,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            "Results",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(2.0.h, 2.0.h, 2.0.h, 1.0.h),
              decoration: BoxDecoration(
                  color: Color(0xffc4c4c4),
                  borderRadius: BorderRadius.circular(10)),
              //constraints: BoxConstraints(maxHeight: 36.2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BMI",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.0.h),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Your BMI is ${widget.bmi.round()}, which falls under the category of ${widget.bmilist[0]} weight. You are ${widget.bmilist[1]} according to your BMI",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fat %",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Total fat constitutes of : ${widget.fat.round()} Kg",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Total muscle mass : ${widget.muscle.round()} Kg",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Fat percentage : ${widget.fatper}%",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Calories ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Calories you need to maintain : ${widget.calories.round()}",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Calories to gain 0.5kg / week : ${widget.calup.round()}",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          "Calories to loose 0.5kg / week : ${widget.caldown.round()}",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            ade.checkforad()
          ],
        ),
      ),
    );
  }
}
