import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../main.dart';

class py_pg extends StatefulWidget {
  py_pg({this.id, @required this.amount});
  String id="5", amount;

  @override
  _py_pgState createState() => _py_pgState();
}

class _py_pgState extends State<py_pg> {
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    oC();
    super.initState();
  }

  void oC() async {
    var options = {
      'key': rzr,
      'amount': widget.amount,
      'name': 'FitZen',
      'description': 'FitZen Payment',
      'prefill': {'contact': 'Enter Mobile'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("22");
    FirebaseFirestore.instance.collection("Users").doc(cru.getuid()).set({
      "Bought": {widget.id: true, "Questions": FieldValue.increment(5), "Ads": false}
    }, SetOptions(merge: true));
    _showtoastsuc();
    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.pop(context);    
    _showtoast();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Page")),
      body: Column(),
    );
  }
}

Razorpay _razorpay;
String em;

final _showtoast = () => Fluttertoast.showToast(
    msg: "payment failed!",
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.black);

final _showtoastlogin = () => Fluttertoast.showToast(
    msg: "Login Please",
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.black);

final _showtoastsuc = () => Fluttertoast.showToast(
    msg: "Payment Successful!",
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.black);
