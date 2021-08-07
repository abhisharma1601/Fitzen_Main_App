import 'package:Fitzen/Corona/Data.dart';
import 'package:Fitzen/Corona/exercises_corona.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class CMP extends StatefulWidget {
  @override
  _CMPState createState() => _CMPState();
}

class _CMPState extends State<CMP> {
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
            "Corona Guidelines",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => coronadata()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 25.76.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.coronavirus,
                      size: 120,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "World Corona\nData and Cases",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff155E63),
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => corona_exe()));
              },
                        child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 25.76.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.run_circle_outlined,
                      size: 120,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Exercises\nagainst corona",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff155E63),
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () async {
                PDFDocument doc =
                    await PDFDocument.fromAsset('Assets/pdfs/coronadiet.pdf');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFViewer(document: doc)));
              },
                          child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 25.76.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.food_bank_outlined,
                      size: 120,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Immunity\nBoosting Diet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff155E63),
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
