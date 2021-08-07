import 'package:Fitzen/Transformations/anexe.dart';
import 'package:Fitzen/exercises/anexercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class tra_Part_exe extends StatefulWidget {
  tra_Part_exe({this.id, this.day, this.id2});
  String id, day, id2;
  @override
  _tra_Part_exeState createState() => _tra_Part_exeState();
}

class _tra_Part_exeState extends State<tra_Part_exe> {
  @override
  void initState() {
    super.initState();
    print(widget.id);
    print(widget.id2);
    print(widget.day);
    getexe();
  }

  Future<void> getexe() async {
    var snap = await FirebaseFirestore.instance
        .collection("Transformation_Plans")
        .doc(widget.id2)
        .collection("Exes")
        .doc(widget.id)
        .collection(widget.day)
        .get();
    for (var i in snap.docs) {
      ex.add(
        an_exe(
          name: i.data()["Name"],
          link: i.data()["Link"],
          disc: i.data()["Disc"],
          sets: i.data()["Sets"],
        ),
      );
    }
    setState(() {});
  }

  List<an_exe> ex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff155E63),
        title: Text(
          widget.day,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Wrap(
                children: ex.length != 0
                    ? ex
                    : [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Center(
                                          child: Icon(
                                        Icons.fitness_center_outlined,
                                        size: 35,
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          "Loading",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class an_exe extends StatelessWidget {
  an_exe({this.link, this.name, this.disc, this.sets});
  String link, name, disc, sets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => anexe(
                      name: name,
                      disc: disc,
                      link: link,
                      sets: sets.replaceAll("\\n", "\n"),
                    )));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
            width: 100.00.w,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 55.5,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(link),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
