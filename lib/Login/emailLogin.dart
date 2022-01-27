import 'package:Fitzen/Screens/MainPage.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/Widgets/Wids.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:string_validator/string_validator.dart';
import '../main.dart';
import 'DataEntry.dart';
import 'emailreg.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;
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
                      width: 60.38.w,
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
                        "Login",
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
                              email = text;
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
                      SizedBox(height: 3.0.h),
                      Text(
                        "Password",
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
                              password = text;
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
                SizedBox(
                  height: 6.0.h,
                ),
                GestureDetector(
                  onTap: () async {
                    print("!343");
                    print(email);
                    if (isEmail(email)) {
                      BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: password);
                        var user = await FirebaseAuth.instance.currentUser;
                        try {
                          var snap = await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(user.uid)
                              .get();
                          var par = await snap.data()["Data"];
                          cru = CurrentUser(
                              FirebaseAuth.instance.currentUser.uid,
                              par["Login_Parameter"]);
                          bool basic = await snap.data()["Basic_Details"];
                          print(basic);
                          if (basic) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main_Page(),
                              ),
                            );
                          } else if (!basic) {
                            if (par["Login_Parameter"].contains("@")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataEntryPage(
                                    data: "Mobile Number",
                                    keyy: TextInputType.phone,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataEntryPage(
                                    data: "Email ID",
                                    keyy: TextInputType.emailAddress,
                                  ),
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(user.uid)
                              .set({
                            "Basic_Details": false,
                            "Data": {
                              "UserId": user.uid,
                              "Login_Parameter": email
                            }
                          });
                          cru = CurrentUser(user.uid, email);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataEntryPage(
                                        keyy: TextInputType.phone,
                                        data: "Mobile Number",
                                      )));
                        }
                      } catch (e) {
                        toast("Enter valid password !");
                      }
                    } else {
                      toast("Enter Valid Email id !");
                    }

                    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(110, 0, 110, 10),
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xff155E63),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email);
                    toast("link sent to registerd email!");
                  },
                  child: Center(
                    child: Text("Forgot password ?"),
                  ),
                ),
                SizedBox(height: 4.75.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "New User ?",
                      style: TextStyle(
                        color: Color(0xff155E63),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
