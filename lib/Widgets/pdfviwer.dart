import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PDF_Viewer extends StatefulWidget {
  PDF_Viewer({this.doc});
  PDFDocument doc;

  @override
  _PDF_ViewerState createState() => _PDF_ViewerState();
}

class _PDF_ViewerState extends State<PDF_Viewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
          child: false
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: widget.doc)),
    );
  }
}
