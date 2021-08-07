import 'dart:async';
import 'package:Fitzen/Payment_Gateway/PaymentPage.dart';
import 'package:Fitzen/Widgets/Toasts.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../main.dart';
import 'package:sizer/sizer.dart';

class Chat_Screen extends StatefulWidget {
  Chat_Screen({this.id});
  String id;
  @override
  _Chat_ScreenState createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  List<Widget> chats = [];
  String chat = "empty!";
  TextEditingController chatcontro = TextEditingController();
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
            "Ask Anything ?",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(cru.getuid())
                        .collection("Chats")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        chats = [];
                        final messages = snapshot.data.docs;
                        for (var msg in messages) {
                          if (msg.data()["sender"]) {
                            chats.add(
                              user_que(que: msg.data()["msg"]),
                            );
                          } else if (!msg.data()["sender"]) {
                            chats.add(user_ans(
                              text: msg.data()["msg"],
                            ));
                          }
                        }
                        return Column(
                          children: chats,
                        );
                      }
                      if (!snapshot.hasData) {
                        print("do");
                        return Column(
                          children: chats,
                        );
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0,
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 0, 8),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: chatcontro,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.multiline,
                      cursorColor: Colors.black,
                      onChanged: (text) {
                        chat = text;
                      },
                      decoration: new InputDecoration(
                        hintText: "   Type question here",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 25,
                    ),
                    onPressed: () async {
                      print(chat.replaceAll(" ", "").length);
                      var snap = await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(cru.getuid())
                          .get();
                      if (chat.replaceAll(" ", "").length != 0) {
                        if (snap.data()["Bought"]["Questions"] > 0) {
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(cru.getuid())
                              .collection("Chats")
                              .doc(DateTime.now().toString())
                              .set({"msg": chat, "sender": true});
                          FirebaseFirestore.instance
                              .collection("Partner_pannel")
                              .doc(cru.getuid())
                              .set({"uid": cru.getuid(), "answered": false});
                          FirebaseFirestore.instance
                              .collection("Partner_pannel")
                              .doc(cru.getuid())
                              .collection("Chats")
                              .doc(DateTime.now().toString())
                              .set({"msg": chat, "sender": true});
                          await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(cru.getuid())
                              .set({
                            "Bought": {"Questions": FieldValue.increment(-1)}
                          }, SetOptions(merge: true));
                          // toast(
                          //     "You are left with ${snap.data()["Bought"]["Questions"] - 1} questions");
                          if (chat.toLowerCase().contains("?") ||
                              chat.toLowerCase().contains("what") ||
                              chat.toLowerCase().contains("how") ||
                              chat.toLowerCase().contains("why")) {
                            Timer(Duration(seconds: 1), () {
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(cru.getuid())
                                  .collection("Chats")
                                  .doc(DateTime.now().toString())
                                  .set({
                                "msg":
                                    "Thanks for using our service and asking question. you will be getting your answer soon.",
                                "sender": false
                              });
                            });
                          }
                          chatcontro.clear();
                          chat = "";
                        } else if (snap.data()["Bought"]["Questions"] == 0) {
                          toast("You are left with 0 questions");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    height: 28.0.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Center(
                                            child: Text(
                                          "Buy More Questions",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            new ListTile(
                                              leading: Icon(
                                                Icons.fiber_manual_record,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                              title: new Text(
                                                'You can Buy 5 more questions for 49/- Rs.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          py_pg(
                                                            id: widget.id,
                                                            amount: "4900",
                                                          )),
                                                );
                                              },
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                                child: Center(
                                                    child: Text(
                                                  "Buy Now",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                          chatcontro.clear();
                          chat = "";
                        }
                        chatcontro.clear();
                        chat = "";
                      } else {
                        chatcontro.clear();
                        chat = "";
                        // FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatCubitState {}

class user_que extends StatelessWidget {
  user_que({this.que});
  String que;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: Text(que),
          ),
        )
      ],
    );
  }
}

class user_ans extends StatelessWidget {
  user_ans({this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xff155E63),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
