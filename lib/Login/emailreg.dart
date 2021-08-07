import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';
import 'package:string_validator/string_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String setemail, setpassword;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0.h, 0, 3.0.h),
                    child: Image(
                      height: 27.59.h,
                      width: 57.38.w,
                      image: AssetImage("Assets/images/LGW.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0.w, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 72, 0),
                        child: Container(
                          child: TextFormField(
                            onChanged: (text) {
                              setemail = text;
                            },
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            textAlign: TextAlign.left,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 6.0),
                              counter: Offstage(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.1.h),
                      Text(
                        "Set Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 72, 0),
                        child: Container(
                          child: TextFormField(
                            onChanged: (text) {
                              setpassword = text;
                            },
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            textAlign: TextAlign.left,
                            cursorColor: Colors.black,
                            obscureText: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 6.0),
                              counter: Offstage(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.4.h),
                Center(
                  child: Text(
                    'By Continuing, you accept our',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          'Terms&Conditions',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                      Text(
                        ' and our ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Privacy policy',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.5.h,
                ),
                GestureDetector(
                  onTap: () async {
                    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
                    if (setemail != null) {
                      if (isEmail(setemail)) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: setemail, password: setpassword);
                          Navigator.pop(context);
                          toast("Enter registered details to login !");
                          BlocProvider.of<ChatCubitCubit>(context)
                              .changeshow(false);
                        } catch (e) {
                          toast("Email already in use !");
                           BlocProvider.of<ChatCubitCubit>(context)
                              .changeshow(false);
                        }
                      } else {
                        toast("enter valid email!");
                        BlocProvider.of<ChatCubitCubit>(context)
                            .changeshow(false);
                      }
                    } else {
                      toast("enter email address !");
                      BlocProvider.of<ChatCubitCubit>(context)
                          .changeshow(false);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(110, 0, 110, 16),
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xff155E63),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
