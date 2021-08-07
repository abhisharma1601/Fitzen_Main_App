import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Image(
                height: 280,
                        width: 340,
                image: AssetImage("Assets/images/LGW.png"),
              ),
            ),
          ),
          Spacer(),         
          Center(
            child: CircularProgressIndicator(           
              backgroundColor: Colors.black,
            ),
          ),
           SizedBox(height: 40),
        ],
      ),
    );
  }
}
