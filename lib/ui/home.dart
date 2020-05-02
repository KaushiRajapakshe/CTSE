// IT17018760
import 'package:flutter/material.dart';
import 'package:insightquiz/utils/firebase_auth.dart';

import '../main_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
            child: new Image.asset(
          'assets/image/back.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 2.0),
                          Container(
                              child: Stack(children: <Widget>[
                            const SizedBox(height: 10.0),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(85.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Exams In App',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFAFAFA)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(90.0, 120.0, 0.0, 0.0),
                              child: Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFAFAFA),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 160.0, 20.0, 20.0),
                              child: Text(
                                '* By using this application, you agree to the following terms of use, privacy policy and license agreement between you and ExamInApp (SLIIT) CTSE 2020. ',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFAFAFA)),
                              ),
                            ),
                            SizedBox(height: 100.0),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 235.0, 20.0, 20.0),
                              child: Text(
                                '* These Terms of Use, Privacy Policy and Cookie Policy govern the use of this application for portable devices called "Exams In App ™".',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFAFAFA)),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 300.0, 20.0, 20.0),
                              child: Text(
                                '* If you do not accept any part of this agreement, you cannot attend the exam.',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFAFAFA)),
                              ),
                            ),
                            const SizedBox(height: 150.0),
                            Container(
                              padding: EdgeInsets.only(top: 365),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => MyApp1()),
                                  );
                                },
                                color: Color(0xFF6A1B9A),
                                shape: StadiumBorder(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Agree and Accept",
                                      style: TextStyle(
//                        fontFamily: 'ArchivoBlack',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 100.0),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(100.0, 570.0, 0.0, 0.0),
                              child: Text(
                                'You are logged in Google ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFAFAFA),
                                ),
                              ),
                            ),
                            const SizedBox(height: 150.0),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 600, left: 70, right: 70, bottom: 10),
                              child: MaterialButton(
                                onPressed: () {
                                  AuthProvider().logOut();
                                },
                                color: Colors.white,
                                shape: StadiumBorder(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Logout",
                                      style: TextStyle(
//                        fontFamily: 'ArchivoBlack',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFF6A1B9A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]))
                        ])),
              ])),
        ),
      ],
    );
  }
}
