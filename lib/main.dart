import 'package:Fitzen/Screens/MainPage.dart';
import 'package:Fitzen/Widgets/Ads.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Login/DataEntry.dart';
import 'Login/home_screen.dart';
import 'Widgets/LoadingScreen.dart';
import 'Widgets/Wids.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

//These are Variables declared which are used in the starting of app
//cru is instance of class which will be used through-out the app for uid,mobilenum,etc
//Screen wid is used to get a starting screen

String mobilenumber;
String uid;
bool spin = false;
CurrentUser cru;
String rzr;
Widget screen = LoadingScreen();
BannerAd ads;
bool adbool = false;
CreateAd ade = CreateAd();
bool adsbool = false;

//MyApp widget will start app

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //decidescreen() func will run and check user authentication in the device and accordingly select the screen
    decidescreen();
    getadsbool();
    ade.getad();
    getkey();
    super.initState();
  }

  Future<void> getkey() async {
    var snap = await FirebaseFirestore.instance
        .collection("App_Data")
        .doc("key_test")
        .get();
    rzr = (snap.data() as dynamic)["value"];
  }

  Future<void> getadsbool() async {
    var snap = await FirebaseFirestore.instance
        .collection("App_Data")
        .doc("Ads")
        .get();
    bool adboool = snap.data()["ad_bool"];
    if (adboool) {
      try {
        var snap = await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .get();
        print("this is bool");
        print((snap.data() as dynamic)["Bought"]["Ads"]);
        if (snap.data()["Bought"]["Ads"]) {
          adsbool = true;
        } else if (!(snap.data() as dynamic)["Bought"]["Ads"]) {
          adsbool = false;
        }
      } catch (e) {
        adsbool = true;
      }
    } else {
      adsbool = false;
    }
  }

  //
  Future<void> decidescreen() async {
    try {
      print(FirebaseAuth.instance.currentUser.uid);
      var snap = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      var par = await (snap.data() as dynamic)["Data"];
      cru = CurrentUser(
          FirebaseAuth.instance.currentUser.uid, par["Login_Parameter"]);
      bool basic = await (snap.data() as dynamic)["Basic_Details"];
      print(basic);
      if (basic) {
        setState(() {
          screen = Main_Page();
        });
      } else if (!basic) {
        if (par["Login_Parameter"].contains("@")) {
          setState(() {
            screen = DataEntryPage(
              data: "Mobile Number",
              keyy: TextInputType.phone,
            );
          });
        } else {
          setState(() {
            screen = DataEntryPage(
              data: "Email ID",
              keyy: TextInputType.emailAddress,
            );
          });
        }
      }
    } catch (e) {
      setState(() {
        screen = Home_Screen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return BlocProvider(
          create: (context) => ChatCubitCubit(),
          child: MaterialApp(
            theme: ThemeData(
                fontFamily: "OpenSans",
                primaryColor: Colors.black,
                accentColor: Colors.white),
            initialRoute: 'Home',
            routes: {
              'Home': (context) => screen,
            },
          ),
        );
      });
    });
  }
}
