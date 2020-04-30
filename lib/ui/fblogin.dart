import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import '../main_home.dart';

void main() => runApp(fblogin());

class fblogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<fblogin> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async{


    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;
    }

  }

  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: <Widget>[
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
            child: _isLoggedIn
                ? Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: ListView(
    children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  const SizedBox(height: 2.0),
                  Container(
                    child: Stack(
                        children: <Widget>[

                          const SizedBox(height: 10.0),

                          Container(
                            padding: EdgeInsets.fromLTRB(85.0, 40.0, 0.0, 0.0),
                            child: Text(
                              'Exams In App',
                              style: TextStyle(
                                  fontSize: 35.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA)
                              ),
                            ),
                          ),

                      Container(
                        padding: EdgeInsets.fromLTRB(90.0, 120.0, 0.0, 0.0),
                        child: Text(
                          'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 20.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA),decoration: TextDecoration.underline,
                          ),
                        ),
                      ),


                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 160.0, 20.0, 0.0),
                            child: Text(
                              '* By using this application, you agree to the following terms of use, privacy policy and license agreement between you and ExamInApp (SLIIT) CTSE 2020. ',
                              style: TextStyle(
                                    fontSize: 14.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA)
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 235.0, 20.0, 0.0),
                            child: Text(
                                  '* These Terms of Use, Privacy Policy and Cookie Policy govern the use of this application for portable devices called "Exams In App ™".',
                                style: TextStyle(
                                  fontSize: 14.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA)
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 300.0, 20.0, 0.0),
                            child: Text(
                              '* If you do not accept any part of this agreement, you cannot attend the exam.',
                                style: TextStyle(
                                  fontSize: 14.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA)
                              ),
                            ),
                          ),

                          const SizedBox(height:150.0),
                          Container(
                            padding: EdgeInsets.only(top: 355),
                            child: MaterialButton(
                              onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MyApp1()),
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
                            padding: EdgeInsets.only(top: 545,left: 110),
                            child:Image.network(userProfile["picture"]["data"]["url"], height: 40.0, width: 40.0,),

                          ),
                          const SizedBox(height: 150.0),
                          Container(
                            padding: EdgeInsets.only(top: 555,left: 170),
                            child: Text(userProfile["name"],
                            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA)),),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(80.0, 520.0, 0.0, 0.0),
                            child: Text(
                              'You are logged in facebook as ',
                              style: TextStyle(
                                  fontSize: 15.0,fontWeight: FontWeight.bold,color: Color(0xFFFAFAFA),

                              ),
                            ),
                          ),



                          const SizedBox(height:150.0),
                          Container(
                            padding: EdgeInsets.only(top: 600,left: 80,right: 80,bottom: 1),
                            child: MaterialButton(
                              onPressed: () {
                                _logout();
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




                        ]
                    )
                  )
                      ])

            ),
                  ]
            )
                  )
                : Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),


              child: Column(
                children: <Widget>[

                  Container(

                    padding: EdgeInsets.only(top: 200),
                    child:Image.asset("assets/image/facebook.png",width: 100,),


                  ),
                    Container(
                      padding: EdgeInsets.only(top: 80),

                      child:Text("Do you want to continue in Facebook?",
                        style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),

                    ),
                  Container(
                    padding: EdgeInsets.only(top: 40,right: 40,left: 40),

                    child:Text("Note : Your name and profile picture will be engage to continue the Exams In App .",
                      style: TextStyle(fontSize: 14 ,
                          color: Colors.white,),
                    ),

                  ),
                  Container(
                    height: 60,
                  ),
                  Column(
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 120,
                          color: Colors.transparent,

                          child: Container(
                            decoration: BoxDecoration(
                                border:Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child:GestureDetector(
                              onTap: ()  {
                                _loginWithFB();
                              },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                   Center(
                                    child: Text('Continue',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Motserrat',
                                          fontSize: 18,
                                        color: Colors.indigo,
                                      ),),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),

                      ]
                  )
                ],
              ),
            )]),

    )
                ))  ]
                );
  }
}