import 'package:flutter/material.dart';
import 'package:insightquiz/services/calls_and_messages_service.dart';
import 'package:insightquiz/services/service_locator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "0767488285";
  final String email = "examinapp@gmail.com";

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.fromLTRB(5.0, 50.0, 0.0, 0.0),
              child: Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.white
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(15.0, 50.0, 5.0, 0.0),
              child: Text(
                'Here is the app for develop the IQ knowlege of the students.In here there are two ways to login to this app.',
                style: TextStyle(
                    fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 5.0, 0.0),
              child: Text(
                'These are the developers of this app.If you have any doubt of this app please contact us.',
                style: TextStyle(
                    fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.white
                ),
              ),
            ),


            Padding(
              padding:EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/image/kaushi.jpg',
                      width: 80.0,
                    ),
                    const SizedBox(width:50.0),

                    Image.asset(
                      'assets/image/pula.jpg',
                      width: 80.0,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding:EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("D.I.K.Rajapakshe", style: TextStyle(

                        fontFamily: 'Motserrat',
                        fontSize: 15,
                        color: Colors.white
                    ),),
                    const SizedBox(width:40.0),

                    Text("M.P.P.Shamil", style: TextStyle(
                        fontFamily: 'Motserrat',
                        fontSize: 15,
                        color: Colors.white
                    ))
                  ],
                ),
              ),
            ),



            const SizedBox(height:50.0),
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
                  onTap: ()  {
                    _service.call(number);
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Image.asset('assets/image/call.png',width: 28),


                      Center(
                        child: Text('         Call With Us',
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
                  onTap: ()  {
                    _service.sendSms(number);
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Image.asset('assets/image/msg.png',width: 28),


                      Center(
                        child: Text('  Message With Us',
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
                  onTap: ()  {
                    _service.sendEmail(email);
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Image.asset('assets/image/gmail.png',width: 28),


                      Center(
                        child: Text('      Send an Email',
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






          ],
        ),
      ),
    ),
    ],
    );
  }
}
