import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final exadded = () => Fluttertoast.showToast(
    msg: "Exercise added!",
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black);

final soon= () => Fluttertoast.showToast(
    msg: "Coming soon!",
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black);

final toast= (text) => Fluttertoast.showToast(
    msg: text,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black);