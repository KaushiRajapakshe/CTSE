import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insightquiz/utils/firebase_auth.dart';
import '../Help.dart';
import 'fblogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;



  @override
  Widget build(BuildContext context){



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

        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView(
            children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50.0),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 70.0, 0.0, 0.0),
                      child: Text(
                        'Exams In',
                        style: TextStyle(
                          fontSize: 70.0,fontWeight: FontWeight.bold,color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 150.0, 0.0, 0.0),
                      child: Text(
                        'App',
                        style: TextStyle(
                            fontSize: 70.0,fontWeight: FontWeight.bold,color: Colors.white
                        ),
                      ),
                    )

                  ],
                ) ,
              ),
                
              const SizedBox(height: 80.0),

            Container(
              height: 40.0,
              color: Colors.transparent,

              child: Container(
                decoration: BoxDecoration(
                  border:Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 2.0
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child:GestureDetector(
                onTap: ()async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("error logging in with google");

                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image.asset('assets/image/google.png',width: 25),

                    Center(
                      child: Text('   Login with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Motserrat',
                        fontSize: 18,
                        color: Colors.white
                      ),),
                    )

                  ],
                ),
              ),
              ),
            ),

              const SizedBox(height: 20.0),


              Column(children: <Widget>[

                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 55.0, right: 20.0),
                        child: Divider(
                          color: Colors.white,
                          height: 36,
                        )),
                  ),
                  Text("OR",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 55.0),
                        child: Divider(
                          color: Colors.white,
                          height: 36,
                        )),
                  ),
                ]),

              ]),








              const SizedBox(height: 20.0),
              Container(
                height: 40.0,
                color: Colors.transparent,

                child: Container(
                  decoration: BoxDecoration(
                      border:Border.all(
                          color: Color(0xFFAA00FF),
                          style: BorderStyle.solid,
                          width: 2.0
                      ),
                      color: Color(0xFFAA00FF),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child:GestureDetector(
                   onTap: ()  {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>fblogin())
                     );
                   },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                            Image.asset('assets/image/facebook.png',width: 28),


                        Center(
                          child: Text('   Login with Facebook',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Motserrat',
                                fontSize: 18,
                                color: Colors.white
                            ),),
                        )

                      ],
                    ),
                  ),
                ),
              ),



              const SizedBox(height: 10.0),


              Column(children: <Widget>[

                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 60),
                        child: Divider(
                          color: Colors.white,
                          height: 30,
                        )),
                  ),
                ]),

              ]),











              const SizedBox(height: 5.0),
              Container(
                height: 25.0,
                color: Colors.transparent,

                child: Container(

                  child:GestureDetector(
                    onTap: ()  {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>MyApp())
                      );
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Image.asset('assets/image/contact.png',width: 16),

                        Container(
                          child: Text('   Contact Us  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Motserrat',
                                fontSize: 14,
                                color: Colors.white
                            ),),
                      )

                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
        ],
        ),
      ),
      ),
    ],

    );

  }



}