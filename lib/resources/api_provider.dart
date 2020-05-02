// IT16178700
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insightquiz/models/category.dart';
import 'package:insightquiz/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";
// using api retrieve list of questions
Future<List<Question>> getQuestions(Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if(difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  // connecting to network
  http.Response res = await http.get(url);
  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  return Question.fromData(questions);
}