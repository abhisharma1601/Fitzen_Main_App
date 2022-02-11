import 'package:Fitzen/Drawer/drawwer.dart';
import 'package:Fitzen/Screens/Diet.dart';
import 'package:Fitzen/Screens/LogBook.dart';
import 'package:Fitzen/Screens/calculator.dart';
import 'package:Fitzen/Home/home.dart';
import 'package:Fitzen/Screens/profile.dart';
import 'package:Fitzen/Transformations/MainPage.dart';
import 'package:Fitzen/cubit/chat_cubit_cubit.dart';
import 'package:Fitzen/exercises/exercises.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Main_Page extends StatefulWidget {
  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  int index = 2;

  List<Widget> widlist = [];

  void push_body() {
    widlist.add(Calculator());
    widlist.add(Exercise_Screen());
    widlist.add(Home_Page(
      done: false,
      name: "",
      quote: "Loading...",
      url: "https://miro.medium.com/max/1080/0*DqHGYPBA-ANwsma2.gif",
    ));
    widlist.add(Diet_Plan());
    widlist.add(LogBook(
      showappbar: false,
    ));
  }

  @override
  void initState() {
    push_body();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.3,
      color: Colors.black,
      inAsyncCall: BlocProvider.of<ChatCubitCubit>(context).state.show,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: AppBar(
          title: Text(
            "FitZen",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff155E63),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: 32,
                )),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Color(0xff2acdfe),
          child: SalomonBottomBar(
              itemShape: StadiumBorder(),
              currentIndex: index,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.green.shade100,
              onTap: (val) {
                setState(() {
                  index = val;
                });
              },
              items: [
                SalomonBottomBarItem(
                  icon: Icon(Icons.calculate_sharp),
                  title: Text("Calculator"),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.fitness_center),
                  title: Text("Exercises"),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.food_bank),
                  title: Text("Diet Plans"),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.fact_check),
                  title: Text("Log Book"),
                ),
              ]),
        ),
        body: widlist[index],
      ),
    );
  }
}
