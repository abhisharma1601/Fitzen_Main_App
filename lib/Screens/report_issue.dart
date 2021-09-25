//This code is of page which is used under any issues button and used for taking any issues from users
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../main.dart';

class Issue_Collector extends StatefulWidget {
  @override
  _Issue_CollectorState createState() => _Issue_CollectorState();
}

class _Issue_CollectorState extends State<Issue_Collector> {
  String issue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          "Report Issues",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff155E63)),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  cursorColor: Colors.black,
                  maxLines: 10,
                  onChanged: (val) {
                    issue = val;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter issue here !",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                try {
                  if (issue.replaceAll(" ", "") != "") {
                    Navigator.pop(context);
                    _mailer(issue);
                    Fluttertoast.showToast(msg: "Issue Reported.");
                  } else
                    Fluttertoast.showToast(msg: "Enter some issue!");
                } catch (e) {
                  Fluttertoast.showToast(msg: "Timeout! Try afyer some time.");
                }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(110, 20, 110, 16),
                height: 46,
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
    );
  }
}

Future<void> _mailer(issue) async {
  // ignore: deprecated_member_use
  String username = "info@stackx.online";
  final smtpServer = SmtpServer("stackx.online",
      ignoreBadCertificate: true,
      username: username,
      password: "StackX@123",
      allowInsecure: true);

  // Create our message.
  final message = Message()
    ..from = Address(username, 'StackX-FitZen')
    ..recipients.add('StackX1617@gmail.com')
    ..subject = 'Issue regarding Fitzen App! by ${cru.getpara()}'
    ..text = issue;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // send the equivalent message

  // close the connection
  await connection.close();
}
