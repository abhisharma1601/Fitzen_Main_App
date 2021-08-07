import 'package:Fitzen/Screens/MainPage.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/Widgets/Wids.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../main.dart';
import 'DataEntry.dart';
import 'emailLogin.dart';

Future<void> loginUser(int type, context) async {
  String otp;

  if (type == 1) {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    print(mobilenumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(milliseconds: 10000),
      phoneNumber: "+91$mobilenumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("auto");
        Navigator.of(context).pop();
        var result =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User user = result.user;
        try {
          var snap = await FirebaseFirestore.instance
              .collection("Users")
              .doc(user.uid)
              .get();
          var par = await snap.data()["Data"];
          cru = CurrentUser(
              FirebaseAuth.instance.currentUser.uid, par["Login_Parameter"]);
          bool basic = await snap.data()["Basic_Details"];
          print(basic);
          if (basic) {
            Navigator.push(
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
          FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
            "Basic_Details": false,
            "Data": {"UserId": user.uid, "Login_Parameter": mobilenumber}
          });
          cru = CurrentUser(user.uid, mobilenumber);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DataEntryPage(
                        keyy: TextInputType.emailAddress,
                        data: "Email Id",
                      )));
        }
        BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Failed");
        BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
      },
      codeSent: (String verificationId, int resendToken) {
        print("sent");
        showDialog(
            context: context,
            builder: (dialogcontext) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Enter OTP",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (text) {
                                otp = text;
                              },
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              autofocus: true,
                              textAlign: TextAlign.left,
                              maxLength: 6,
                              cursorColor: Color.fromRGBO(121, 97, 247, 1),
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "OTP Here",
                                hintStyle: TextStyle(color: Color(0xffCBCBCB)),
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
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: otp);

                                UserCredential result = await FirebaseAuth
                                    .instance
                                    .signInWithCredential(credential);
                                User user = result.user;
                                Navigator.pop(context);
                                try {
                                  var snap = await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(user.uid)
                                      .get();
                                  var par = await snap.data()["Data"];
                                  cru = CurrentUser(
                                      FirebaseAuth.instance.currentUser.uid,
                                      par["Login_Parameter"]);
                                  bool basic =
                                      await snap.data()["Basic_Details"];
                                  if (basic) {
                                    Navigator.push(
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
                                  print(e);
                                  FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(user.uid)
                                      .set({
                                    "Basic_Details": false,
                                    "Data": {
                                      "UserId": user.uid,
                                      "Login_Parameter": mobilenumber
                                    }
                                  });
                                  cru = CurrentUser(user.uid, mobilenumber);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DataEntryPage(
                                        keyy: TextInputType.emailAddress,
                                        data: "Email Id",
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                toast("Enter Valid OTP");
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.forward,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
        BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  if (type == 2) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  if (type == 3) {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    GoogleSignIn gs = GoogleSignIn(scopes: ['email']);
    GoogleSignInAccount google_user = await gs.signIn();
    GoogleSignInAuthentication google_auth = await google_user.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: google_auth.idToken, accessToken: google_auth.accessToken);
    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User user = authResult.user;
    try {
      var snap = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();
      var par = await snap.data()["Data"];
      cru = CurrentUser(
          FirebaseAuth.instance.currentUser.uid, par["Login_Parameter"]);
      bool basic = await snap.data()["Basic_Details"];
      print(basic);
      if (basic) {
        Navigator.push(
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
      FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
        "Basic_Details": false,
        "Data": {"UserId": user.uid, "Login_Parameter": user.email}
      });
      cru = CurrentUser(user.uid, user.email);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DataEntryPage(
            keyy: TextInputType.phone,
            data: "Mobile Number",
          ),
        ),
      );
    }
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
  }
}
