import 'package:Fitzen/Corona/Mainpage.dart';
import 'package:Fitzen/Drawer/drawwer.dart';
import 'package:Fitzen/Screens/Diet.dart';
import 'package:Fitzen/Screens/LogBook.dart';
import 'package:Fitzen/Screens/calculator.dart';
import 'package:Fitzen/Screens/profile.dart';
import 'package:Fitzen/Transformations/MainPage.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/exercises.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class Main_Page extends StatefulWidget {
  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: AppBar(
          title: Text(
            "FitZen",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff155E63),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: 32,
                )),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 2.0.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calculator(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.1.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Exercise_Screen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.2.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TMP(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.3.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Diet_Plan(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.4.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogBook(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.5.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CMP(),
                          ),
                        );
                      },
                      child: Container(
                        height: 26.0.h,
                        width: 44.44.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/images/1.6.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.h),
                child: Container(
                  height: 26.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                  decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      // image: DecorationImage(
                      //     image: AssetImage("Assets/images/ofs.png"),
                      //     fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 12,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(height: 20.0.h,width: 20.0.h,image: AssetImage("Assets/images/Logo1.png"))
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'OFFICIAL\n',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30,
                                  fontFamily: "Saira",
                                  height: 1),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'STORE\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900,fontSize: 26,color: Colors.black87)),
                                TextSpan(text: 'COMING SOON',style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1),),
                              ],
                            ),
                          ),
                          // Text(
                          //   "OFFICIAL\nSTORE",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: 30,
                          //       height: 1),
                          // ),
                          //Text("STORE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 26),),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
