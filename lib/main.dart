import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insightquiz/services/service_locator.dart';
import 'package:insightquiz/ui/home.dart';
import 'package:insightquiz/ui/login.dart';
import 'package:insightquiz/ui/splash.dart';

import 'package:splashscreen/splashscreen.dart';

void main() {
  setupLocator();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Please Wait..',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.black),
      ),
      seconds: 9,
      navigateAfterSeconds: MainScreen(),
      image: new Image.asset(
          'assets/loading.gif'),
      backgroundColor: Colors.black ,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 140.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Color(0xFFAA00FF),

    );
  }
}


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if(!snapshot.hasData || snapshot.data == null)
          return LoginPage();
        return HomePage();
      },
    );
  }
}