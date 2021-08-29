import 'package:Fitzen/Widgets/Wids.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LogBook extends StatefulWidget {
  LogBook({@required this.showappbar});
  bool showappbar;
  @override
  _LogBookState createState() => _LogBookState();
}

List<Widget> logboxes = [
  Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(Icons.hourglass_bottom),
        SizedBox(height: 5),
        Column(
          children: [
            Text("Fetching Data", style: TextStyle(fontSize: 20)),
          ],
        )
      ],
    ),
  )
];

class _LogBookState extends State<LogBook> {
  bool spinn = false;

  @override
  void initState() {
    getlogs();
    super.initState();
  }

  Future<void> getlogs() async {
    setState(() {
      spinn = true;
    });
    var snap =
        await FirebaseFirestore.instance.collection("Users").doc(cru.uid).get();
    try {
      var logs = snap.data()["Logs"];
      logboxes = [];
      await logs.forEach(
        (k, v) => logboxes.add(
          LogBox(
              fun: () => {
                    setState(() {
                      print("deleted");
                    })
                  },
              title: k,
              date: v["Date"].toString().substring(0, 10),
              value: v["Value"]),
        ),
      );
    } catch (e) {
      logboxes.add(Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.warning),
            SizedBox(height: 5),
            Column(
              children: [
                Text("No Logs Saved !", style: TextStyle(fontSize: 20)),
              ],
            )
          ],
        ),
      ));
    }
    setState(() {
      spinn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title;
    double val;

    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: spinn,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      height: 220,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                              child: Text(
                            "Enter Log Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 25, 12, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Title',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: (text) {
                                        title = text;
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      textAlign: TextAlign.center,
                                      maxLength: 20,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Enter title",
                                        hintStyle:
                                            TextStyle(color: Color(0xffCBCBCB)),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 6.0),
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Reading',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: (text) {
                                        val = double.parse(text);
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      textAlign: TextAlign.center,
                                      maxLength: 6,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Enter Value (kg)",
                                        hintStyle:
                                            TextStyle(color: Color(0xffCBCBCB)),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 6.0),
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
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(cru.uid)
                                    .set({
                                  "Logs": {
                                    title: {
                                      "Date": DateTime.now().toString(),
                                      "Value": val,
                                      "Gdata": [
                                        {DateTime.now().day.toString(): val}
                                      ]
                                    }
                                  }
                                }, SetOptions(merge: true));
                                Navigator.pop(context);
                                getlogs();
                              },
                              child: Icon(
                                Icons.navigate_next_sharp,
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                  );
                });
          },
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Color(0xff155E63),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
            )),
          ),
        ),
        appBar: widget.showappbar
            ? AppBar(
                backgroundColor: Color(0xff155E63),
                title: Text(
                  "Log Book",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : AppBar(
                toolbarHeight: 0,
              ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: logboxes,
          ),
        ),
      ),
    );
  }
}

class LogBox extends StatelessWidget {
  LogBox({
    @required this.title,
    @required this.date,
    @required this.value,
    @required this.fun,
  });
  String title, date;
  var value;
  double vall;
  List<GraphData> gdata = [];
  final VoidCallback fun;

  Future<void> getdata() async {
    gdata = [];
    var snap =
        await FirebaseFirestore.instance.collection("Users").doc(cru.uid).get();
    for (var i in snap.data()["Logs"][title]["Gdata"]) {
      i.forEach((k, v) {
        print(k);
        print(v);
        gdata.add(
          GraphData(v.toDouble(), k),
        );
      });
    }
  }

  Future<void> getlogs() async {
    var snap =
        await FirebaseFirestore.instance.collection("Users").doc(cru.uid).get();
    try {
      var logs = snap.data()["Logs"];
      logboxes = [];
      await logs.forEach(
        (k, v) => logboxes.add(
          LogBox(
              fun: fun,
              title: k,
              date: v["Date"].toString().substring(0, 10),
              value: v["Value"]),
        ),
      );
    } catch (e) {
      logboxes.add(Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.warning),
            SizedBox(height: 5),
            Column(
              children: [
                Text("No Logs Saved !", style: TextStyle(fontSize: 20)),
              ],
            )
          ],
        ),
      ));
    }
    fun();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Text(
                    "$value Kg",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Text("($date)")
                ],
              )
            ],
          ),
          Spacer(),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: 160,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              "Enter Log Details",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 25, 12, 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'New Value',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        onChanged: (text) {
                                          vall = double.parse(text);
                                        },
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        textAlign: TextAlign.center,
                                        maxLength: 6,
                                        maxLengthEnforced: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "Enter Value",
                                          hintStyle: TextStyle(
                                              color: Color(0xffCBCBCB)),
                                          contentPadding:
                                              EdgeInsets.only(bottom: 6.0),
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
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(cru.uid)
                                      .set({
                                    "Logs": {
                                      title: {
                                        "Date": DateTime.now().toString(),
                                        "Value": vall,
                                        "Gdata": FieldValue.arrayUnion([
                                          {DateTime.now().day.toString(): vall}
                                        ])
                                      }
                                    }
                                  }, SetOptions(merge: true));

                                  Navigator.pop(context);
                                  getlogs();
                                },
                                child: Icon(
                                  Icons.navigate_next_sharp,
                                  size: 35,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.update, size: 35)),
          SizedBox(width: 4),
          GestureDetector(
            onTap: () async {
              await FirebaseFirestore.instance
                  .collection("Users")
                  .doc(cru.uid)
                  .set({
                "Logs": {title: FieldValue.delete()}
              }, SetOptions(merge: true));
              print(logboxes);
              if (logboxes.length == 1) {
                await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cru.uid)
                    .update({"Logs": FieldValue.delete()});
              }
              getlogs();
            },
            child: Icon(Icons.delete, size: 35),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: () async {
              await getdata();
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: 250,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: SfCartesianChart(
                            enableSideBySideSeriesPlacement: true,
                            title:
                                ChartTitle(text: "$title Graphical analysis"),
                            primaryXAxis: CategoryAxis(),
                            series: <LineSeries<GraphData, String>>[
                              LineSeries<GraphData, String>(
                                  dataSource: gdata,
                                  xValueMapper: (GraphData data, _) =>
                                      data.date,
                                  yValueMapper: (GraphData data, _) =>
                                      data.value,
                                  xAxisName: "Weight",
                                  yAxisName: "Date")
                            ]),
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.bar_chart,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
