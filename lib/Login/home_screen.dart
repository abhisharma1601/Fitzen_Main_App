import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';
import '../main.dart';
import 'LoginBrain.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubitCubit, ChatCubitState>(
        builder: (context, state) {
      return ModalProgressHUD(
        opacity: 0.3,
        color: Colors.black,
        inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.25.h, bottom: 0.125.h),
                child: Image(
                  height: 20.06.h,
                  width: 52.4.w,
                  image: AssetImage("Assets/images/LGWS.png"),
                ),
              ),
              Container(
                height: 52.78.h,
                width: 89.0.w,
                decoration: BoxDecoration(
                  color: Color(0xff155E63),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.475.h),
                      child: Text(
                        "Enter Mobile Number",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 7.875.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.833.w),
                      child: Container(
                        height: 7.34.h,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              height: 10.0.h,
                              width: 76.0.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "+91",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 8.5.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (text) {
                                        mobilenumber = text;
                                      },
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      decoration: new InputDecoration(
                                        hintText: "Enter Number here",
                                        hintStyle: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0.h),
                    Text(
                      'By Continuing, you accept our',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            'Terms&Conditions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),
                        Text(
                          ' and our ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        GestureDetector(
                          child: Text(
                            'Privacy policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 6.78.h),
                    GestureDetector(
                      onTap: () {
                        if (mobilenumber.length == 10 &&
                            isNumeric(mobilenumber)) {
                          loginUser(1, context);
                        } else {
                          toast("Enter Valid Mobile Number!");
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16.49.w, 0, 16.49.w, 0),
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                            child: Text(
                          "Generate OTP",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Color(0xff155E63),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "Sign in with",
                      style: TextStyle(
                        color: Color(0xff155E63),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Color(0xff155E63),
                  )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: SignInButton(
                        Buttons.Email,
                        text: "Sign in with Email",
                        onPressed: () {
                          loginUser(2, context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      child: SignInButton(
                        Buttons.Google,
                        text: "Google Sign-up",
                        onPressed: () {
                          loginUser(3, context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5)
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
