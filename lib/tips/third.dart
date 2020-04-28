import 'dart:io';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:insightquiz/database/crud.dart';
import 'package:insightquiz/ui/pages/home.dart';

import '../delayed_animation.dart';
import 'first.dart';
import 'fourth.dart';
class Third extends StatefulWidget {
  @override
  _Third createState() => _Third();
}

class _Third extends State<Third> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  String name = '';

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    crud c = new crud();
    c.getCategory(name);
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        children: <Widget>[
                          AvatarGlow(
                            endRadius: 90,
                            duration: Duration(seconds: 2),
                            glowColor: Colors.white24,
                            repeat: true,
                            repeatPauseDuration: Duration(seconds: 2),
                            startDelay: Duration(seconds: 1),
                            child: Material(
                                elevation: 8.0,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  child: new Image.asset('assets/e.png',
                                      height: 85.0, width: 85.0),
                                  radius: 50.0,
                                )),
                          ),
                          DelayedAnimation(
                            child: Text(
                              "You can",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  color: color),
                            ),
                            delay: delayedAmount + 1000,
                          ),
                          DelayedAnimation(
                            child: Text(
                              "romove the Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  color: color),
                            ),
                            delay: delayedAmount + 2000,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          DelayedAnimation(
                            child: RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 83.0),
                                child: Text('Start',
                                    style: TextStyle(
                                        color: Color(0xFF7B1FA2),
                                        fontSize: 20)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()),
                                  );
                                }),
                            delay: delayedAmount + 4000,
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          DelayedAnimation(
                            child: new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Fourth()),
                                );
                              },
                              child: Text(
                                "Go with next tips...".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: color),
                              ),
                            ),
                            delay: delayedAmount + 5000,
                          ),
                        ],
                      )),
                ],
              ))),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF7B1FA2),
        ),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
