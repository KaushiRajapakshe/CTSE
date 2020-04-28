enum Type {
  multiple,
  boolean
}

enum Difficulty {
  easy,
  medium,
  hard
}
// Question class implementation
class Question {
  final String categoryName;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question({this.categoryName, this.type, this.difficulty, this.question, this.correctAnswer, this.incorrectAnswers});

  Question.fromMap(Map<String, dynamic> data):
    categoryName = data["category"],
    type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
    difficulty = data["difficulty"] == "easy" ? Difficulty.easy : Difficulty.easy,
    question = data["question"],
    correctAnswer = data["correct_answer"],
    incorrectAnswers = data["incorrect_answers"];

  static List<Question> fromData(List<Map<String,dynamic>> data){
    return data.map((question) => Question.fromMap(question)).toList();
  }

}