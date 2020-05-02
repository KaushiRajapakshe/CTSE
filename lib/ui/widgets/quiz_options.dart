// IT16178700
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insightquiz/models/category.dart';
import 'package:insightquiz/models/question.dart';
import 'package:insightquiz/resources/api_provider.dart';
import 'package:insightquiz/ui/pages/error.dart';
import 'package:insightquiz/ui/pages/quiz_page.dart';

// QuizOptionsDialog Stateful Widget implementation
class QuizOptionsDialog extends StatefulWidget {
  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

// _QuizOptionsDialogState implementation
class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() { 
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Text(widget.category.name, style: Theme.of(context).textTheme.title.copyWith(),),
            ),
            SizedBox(height: 10.0),
            Text("Total Number of Questions"),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                children: <Widget>[
                  SizedBox(width: 0.0),
                  ActionChip(
                    label: Text("10"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 10 ? Colors.deepPurple : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(10),
                  )
                  
                ],
              ),
            ),
            SizedBox(height: 20.0),
            processing ? CircularProgressIndicator() : RaisedButton(
              child: Text("Start Quiz"),
              onPressed: _startQuiz,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      );
  }

  // select number of question to show implementation
  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  // select difficulty to questions implementation
  _selectDifficulty(String s) {
    setState(() {
      _difficulty=s;
    });
  }

  // Start question implementation
  void _startQuiz() async {
    setState(() {
      processing=true;
    });
    try {
      List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ErrorPage(message: "There are not enough questions in the category, with the options you selected.",)
        ));
        return;
      }
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => QuizPage(questions: questions, category: widget.category,)
      ));
    }on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Can't reach the servers, \n Please check your internet connection.",)
      ));
    } catch(e){
      print(e.message);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Unexpected error trying to connect to the API",)
      ));
    }
    setState(() {
      processing=false;
    });
  }
}