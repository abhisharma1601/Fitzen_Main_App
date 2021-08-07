// import 'package:Fitzen/Transformations/Tra_Weeks.dart';
// import 'package:Fitzen/exercises/Pre_Plan_Page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'Tra_Pre_Plans.dart';

// class Tra_plans extends StatefulWidget {
//   @override
//   _Tra_plansState createState() => _Tra_plansState();
// }

// class _Tra_plansState extends State<Tra_plans> {
//   List<Pre_Plan_Wid> ppw = [];

//   @override
//   void initState() {
//     super.initState();
//     ppwg();
//   }

//   Future<void> ppwg() async {
//     ppw = [];
//     var snap = await FirebaseFirestore.instance.collection("Transformation_Plans").get();
//     for (var i in snap.docs) {
//       ppw.add(
//         Pre_Plan_Wid(
//           name: i.data()["Name"],
//           id: i.data()["id"],          
//         ),
//       );
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff155E63),
//         title: Text(
//           "Pre-Made Plans",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: ppw.length != 0
//                 ? ppw
//                 : [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Center(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                               ),
//                               padding: EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Center(
//                                       child: Icon(
//                                     Icons.fitness_center_outlined,
//                                     size: 35,
//                                   )),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Center(
//                                     child: Text(
//                                       "Loading",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Pre_Plan_Wid extends StatelessWidget {
//   Pre_Plan_Wid({this.name, this.id});
//   String name, id;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>Tra_weeks(id: id)));
//         },
//         child: Container(
//           height: 70,
//           decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadiusDirectional.circular(5)),
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 name,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Spacer(),
//               Icon(
//                 Icons.fitness_center,
//                 size: 25,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
