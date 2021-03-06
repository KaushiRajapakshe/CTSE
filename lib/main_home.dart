// IT16178700
import 'package:flutter/material.dart';

import 'home_page.dart';

//void main() => runApp(MyApp());

// MyApp1 Stateless Widget implementation
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insight Quiz',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent,
          fontFamily: "Montserrat",
          buttonColor: Colors.deepPurple,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary
          )
      ),
      home: Home(),
    );
  }
}
