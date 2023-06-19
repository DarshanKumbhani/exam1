import 'dart:convert';

import 'package:exam_1/exam/model/quiz_model.dart';
import 'package:http/http.dart' as http;

class Api_Data
{

  static Api_Data  api_data = Api_Data();

  Future<QuizModel> apiData()
  async {
    String link="https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple";

    var response= await http.get(Uri.parse(link));

    var json=jsonDecode(response.body);

    QuizModel quizModel = QuizModel.fromJson(json);

    return quizModel;
  }
}