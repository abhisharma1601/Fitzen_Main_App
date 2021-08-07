import 'package:Fitzen/Screens/MainPage.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';
import '../main.dart';

class DataEntryPage extends StatefulWidget {
  DataEntryPage({this.data, this.keyy});
  TextInputType keyy;
  String data;

  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  String name, dataentered, gender;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text("Basic Details",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 6.0.h, 0, 6.0.h),
                    child: Image(
                      height: 23.77.h,
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
                        "Enter Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(
                        "Full Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10.0.h, 0),
                        child: Container(
                          child: TextFormField(
                            onChanged: (text) {
                              name = text;
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
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.0.h),
                      Text(
                        widget.data,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10.0.h, 0),
                        child: Container(
                          child: TextFormField(
                            onChanged: (text) {
                              dataentered = text;
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
                            keyboardType: widget.keyy,
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
                  onTap: () {
                    print("10");
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(cru.getuid())
                        .set({
                      "Bought": {"0": false, "1": false, "2": false, "3": false},
                      "Data": {
                        widget.data: dataentered,
                        "Name": name,
                        "Profile_Pic":
                            "https://static.thenounproject.com/png/187803-200.png"
                      }
                    }, SetOptions(merge: true));
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(cru.getuid())
                        .update({"Basic_Details": true});
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Main_Page()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(110, 20, 110, 16),
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xff155E63),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                      "Submit",
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
