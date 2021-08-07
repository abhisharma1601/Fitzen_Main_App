// import 'package:Fitzen/Drawer/drawwer.dart';
// import 'package:Fitzen/Screens/LogBook.dart';
// import 'package:Fitzen/Screens/calculator.dart';
// import 'package:Fitzen/exercises/exercises.dart';
// import 'package:flutter/material.dart';

// class Pt_Page extends StatefulWidget {
//   @override
//   _Pt_PageState createState() => _Pt_PageState();
// }

// class _Pt_PageState extends State<Pt_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Training Plans",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color(0xff155E63),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Calculator(),
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 185,
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("Assets/images/1.jpg"),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Exercise_Screen(),
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 185,
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("Assets/images/2.jpg"),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//             Container(
//               height: 185,
//               margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("Assets/images/3.jpg"),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(10)),
//             ),
//             Container(
//               height: 185,
//               margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("Assets/images/4.jpg"),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(10)),
//             ),
//             SizedBox(height: 5),
//           ],
//         ),
//       ),
//     );
//   }
// }
