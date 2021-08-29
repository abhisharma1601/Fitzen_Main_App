import 'package:Fitzen/Screens/Resultscreen.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/Widgets/Wids.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sizer/sizer.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Color male_color = Color(0xffC4C4C4);
  Color female_color = Color(0xffC4C4C4);
  bool gender;
  double height = 165.0;
  int age = 22;
  int weight = 55;
  double waist = 28.0, workout = 4.0;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              FitnessCal results = FitnessCal(
                  gender: gender,
                  weight: weight,
                  age: age,
                  height: height,
                  waist: waist,
                  workout: workout);
              results.bmical();
              results.fatcal();
              results.caloriecal();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmi: results.bmi.roundToDouble(),
                            caldown: results.caloriedown.roundToDouble(),
                            calup: results.calorieup.roundToDouble(),
                            calories: results.calorie.roundToDouble(),
                            bmilist: results.bmiwording,
                            fat: results.fat.roundToDouble(),
                            muscle: results.muscle.roundToDouble(),
                            fatper: results.fatperc.roundToDouble(),
                          )));
            } catch (e) {
              toast("Select Gender!");
            }
          },
          hoverColor: Colors.white,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.forward,
            color: Colors.white,
            size: 30,
          ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Color(0xff155E63),
        //   title: Text(
        //     "Fitness Calculator",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = true;
                          male_color = Color(0xff8B8989);
                          female_color = Color(0xffC4C4C4);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: male_color,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.fromLTRB(3.0.w, 1.5.h, 1.5.w, 1.5.h),
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.grey.shade800,
                              size: 22.5.w,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 7.5.w),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = false;
                          female_color = Color(0xff8B8989);
                          male_color = Color(0xffC4C4C4);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            color: female_color,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.fromLTRB(1.5.w, 1.5.h, 3.0.w, 1.5.h),
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 22.5.w,
                              color: Colors.grey.shade800,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 7.5.w),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 18.5.h,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: Color(0xffC4C4C4),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 4.5.h,
                          fontWeight: FontWeight.w500),
                    )),
                    SizedBox(height: 0.5.h),
                    Center(
                      child: Text(
                        "${height.round()} cm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 2.6.h,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Slider(
                      activeColor: Color(0xff656262),
                      inactiveColor: Color(0xff8B8989),
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                          print(height);
                        });
                      },
                      max: 220,
                      min: 130,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 9),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            "Age",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          )),
                          SizedBox(height: 2),
                          NumberPicker(
                            itemHeight: 30,
                            value: age,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) => setState(() => age = value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 9),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            "Weight (kg)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          )),
                          SizedBox(height: 2),
                          NumberPicker(
                            itemHeight: 30,
                            value: weight,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) => setState(() => weight = value),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                              child: Text(
                            "Waist",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          )),
                          SizedBox(height: 4),
                          Center(
                            child: Text(
                              "${waist.round()} inch",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      waist--;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(
                                      Icons.horizontal_rule,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      waist++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                              child: Text(
                            "Workout",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          )),
                          SizedBox(height: 4),
                          Center(
                            child: Text(
                              "${workout.round()} days/week",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (workout > 0) workout--;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(
                                      Icons.horizontal_rule,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (workout < 7) {
                                        workout++;
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:10),
            ],
          ),
        ),
      ),
    );
  }
}
