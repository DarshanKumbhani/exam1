import 'package:exam_1/exam/model/quiz_model.dart';
import 'package:exam_1/exam/utils/api_Helper.dart';
import 'package:flutter/cupertino.dart';

class QuizProvider extends ChangeNotifier
{

  int i=0;
  bool a=false;

  Future<QuizModel> apiDataParsing()
  async {
    return await Api_Data.api_data.apiData();
  }

  void changQustion() {
    if (i < 9) {
      i++;
    }
    else{
      a=true;
    }

    notifyListeners();
  }
}