import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/anexercise.dart';
import 'package:Fitzen/exercises/Body_Parts.dart';
import 'package:Fitzen/exercises/Custom_Plans.dart';
import 'package:Fitzen/exercises/Pre_Plans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class Exercise_Screen extends StatefulWidget {
  @override
  _Exercise_ScreenState createState() => _Exercise_ScreenState();
}

class _Exercise_ScreenState extends State<Exercise_Screen> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xff155E63),
        //   title: Text(
        //     "Excercise Plans",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Pre_Plans()));
                },
                child: Container(
                  height: 190,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Color(0xff155E63),
                      // ),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("Assets/images/premade.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                // child: Container(
                //   margin: EdgeInsets.symmetric(horizontal: 3.2.w,),
                //   height: 23.96.h,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.withOpacity(0.5),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Row(
                //     children: [
                //       Image(
                //           height: 20.0.h,
                //           width: 38.0.w,
                //           image: AssetImage("Assets/images/gym.png")),
                //       Spacer(),
                //       Text(
                //         "Pre-Made\nExercise Plans",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: Color(0xff155E63),
                //             fontSize: 25,
                //             fontWeight: FontWeight.w700),
                //       ),
                //       SizedBox(width: 4.0.w),
                //     ],
                //   ),
                // ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Body_Parts(
                                appbar: true,
                              )));
                },
                child: Container(
                  height: 190,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Color(0xff155E63),
                      // ),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("Assets/images/abp.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                // child: Container(
                //   margin: EdgeInsets.symmetric(horizontal: 3.2.w, ),
                //   height: 23.96.h,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.withOpacity(0.5),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Row(
                //     children: [
                //       Image(
                //           height: 120,
                //           width: 140,
                //           image: AssetImage("Assets/images/exe.png")),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       Text(
                //         "Body Part\nAll Exercises",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: Color(0xff155E63),
                //             fontSize: 25,
                //             fontWeight: FontWeight.w700),
                //       ),
                //       SizedBox(width: 15),
                //     ],
                //   ),
                // ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Custom_Plans()));
                },
                child: Container(
                  height: 190,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Color(0xff155E63),
                      // ),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("Assets/images/custom.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                // child: Container(
                //   margin: EdgeInsets.symmetric(horizontal: 12,),
                //   height: 23.96.h,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.withOpacity(0.5),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Row(
                //     children: [
                //       Image(
                //           height: 120,
                //           width: 140,
                //           image: AssetImage("Assets/images/customex.png")),
                //       SizedBox(
                //         width: 12,
                //       ),
                //       Text(
                //         "Custom\nExercise Plans",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: Color(0xff155E63),
                //             fontSize: 25,
                //             fontWeight: FontWeight.w700),
                //       ),
                //       SizedBox(width: 12),
                //     ],
                //   ),
                // ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
