import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class Diet_Plan extends StatefulWidget {
  @override
  _Diet_PlanState createState() => _Diet_PlanState();
}

class _Diet_PlanState extends State<Diet_Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Diet Plans",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff155E63),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                PDFDocument doc =
                    await PDFDocument.fromAsset('Assets/pdfs/wgp.pdf');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFViewer(document: doc)));
              },
              child: Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/wgp.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff155E63))),
              ),
            ),
            GestureDetector(
              onTap: () async {
                PDFDocument doc =
                    await PDFDocument.fromAsset('Assets/pdfs/wlp.pdf');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFViewer(document: doc)));
              },
              child: Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/wlp.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff155E63))),
              ),
            ),
            GestureDetector(
              onTap: () async {
                PDFDocument doc =
                    await PDFDocument.fromAsset('Assets/pdfs/fcp.pdf');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFViewer(document: doc)));
              },
              child: Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/fcp.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff155E63))),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
