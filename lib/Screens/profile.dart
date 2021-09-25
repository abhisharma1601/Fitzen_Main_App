import 'dart:io';
import 'package:Fitzen/Screens/LogBook.dart';
import 'package:Fitzen/Screens/report_issue.dart';
import 'package:Fitzen/Transformations/MainPage.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/Custom_Plans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> data() async {
    BlocProvider.of<ChatCubitCubit>(context).changeshow(true);
    var snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(cru.getuid())
        .get();
    name = snap.data()["Data"]["Name"];
    profilepic = snap.data()["Data"]["Profile_Pic"];
    print(profilepic);
    setState(() {});
    BlocProvider.of<ChatCubitCubit>(context).changeshow(false);
  }

  @override
  void initState() {
    data();
    ade.getad();
    super.initState();
  }

  String name = "";
  String profilepic = "";
  File _image;
  final picker = ImagePicker();

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
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff155E63),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                //height: 22.0.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (profilepic ==
                            "https://static.thenounproject.com/png/187803-200.png") {
                          BlocProvider.of<ChatCubitCubit>(context)
                              .changeshow(true);
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);
                          setState(() async {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              var reference = FirebaseStorage.instance
                                  .ref()
                                  .child("ProfilePics/${cru.getuid()}");
                              var uploadTask =
                                  reference.putData(_image.readAsBytesSync());
                              String url =
                                  await (await uploadTask).ref.getDownloadURL();
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(cru.getuid())
                                  .set({
                                "Data": {"Profile_Pic": url}
                              }, SetOptions(merge: true));
                              data();
                            } else {
                              print('No image selected.');
                            }
                          });
                          BlocProvider.of<ChatCubitCubit>(context)
                              .changeshow(false);
                        } else {
                          print("2");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    height: 310,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          width: 300,
                                          child: PhotoView(
                                            imageProvider:
                                                NetworkImage(profilepic),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection("Users")
                                                        .doc(cru.getuid())
                                                        .set({
                                                      "Data": {
                                                        "Profile_Pic":
                                                            "https://static.thenounproject.com/png/187803-200.png"
                                                      }
                                                    }, SetOptions(merge: true));
                                                    Navigator.pop(context);
                                                    data();
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Center(
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.replay_circle_filled,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    final pickedFile =
                                                        await picker.getImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    setState(() async {
                                                      if (pickedFile != null) {
                                                        _image = File(
                                                            pickedFile.path);
                                                        var reference =
                                                            FirebaseStorage
                                                                .instance
                                                                .ref()
                                                                .child(
                                                                    "ProfilePics/${cru.getuid()}");
                                                        var uploadTask = reference
                                                            .putData(_image
                                                                .readAsBytesSync());
                                                        String url =
                                                            await (await uploadTask)
                                                                .ref
                                                                .getDownloadURL();
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("Users")
                                                            .doc(cru.getuid())
                                                            .set(
                                                                {
                                                              "Data": {
                                                                "Profile_Pic":
                                                                    url
                                                              }
                                                            },
                                                                SetOptions(
                                                                    merge:
                                                                        true));
                                                        data();
                                                        Navigator.pop(context);
                                                      } else {
                                                        print(
                                                            'No image selected.');
                                                      }
                                                    });
                                                  }),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 16.5.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16.0.w,
                          backgroundImage: NetworkImage(profilepic),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        SizedBox(height: 2),
                        FittedBox(
                          child: Text(
                            cru.getpara(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Divider(
              //   color: Colors.black,
              // ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(1.0.h, 1.3.h, 1.0.h, 1.3.h),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Custom_Plans(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Icon(
                            Icons.copy,
                            color: Colors.red,
                            size: 7.0.w,
                          ),
                          SizedBox(
                            width: 2.0.h,
                          ),
                          Text(
                            "My Plans",
                            style: TextStyle(fontSize: 2.5.h),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogBook(
                                showappbar: true,
                              ),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Icon(
                            Icons.save,
                            color: Color(0xff052F5F),
                            size: 7.0.w,
                          ),
                          SizedBox(
                            width: 2.0.h,
                          ),
                          Text(
                            "My Logs",
                            style: TextStyle(fontSize: 2.5.h),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TMP(
                                      showappbar: true,
                                    )));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Icon(
                            Icons.fitness_center,
                            color: Color(0xff7FB069),
                            size: 7.0.w,
                          ),
                          SizedBox(
                            width: 2.0.h,
                          ),
                          Text(
                            "Trainings",
                            style: TextStyle(fontSize: 2.5.h),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Issue_Collector()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Icon(
                            Icons.rate_review,
                            color: Color(0xff19535F),
                            size: 7.0.w,
                          ),
                          SizedBox(
                            width: 2.0.h,
                          ),
                          Text(
                            "Report Issue",
                            style: TextStyle(fontSize: 2.5.h),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 2.0.w,
                        ),
                        Icon(
                          Icons.share,
                          color: Color(0xffBEA57D),
                          size: 7.0.w,
                        ),
                        SizedBox(
                          width: 2.0.h,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(fontSize: 2.5.h),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              //ade.checkforad(),
              Padding(
                padding: EdgeInsets.all(2.0.h),
                child: GestureDetector(
                    onTap: () {
                      launch("https://stackx.online");
                    },
                    child: Text(
                      "By StackX",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
