import 'package:exam_1/exam/provider/quiz_provider.dart';
import 'package:exam_1/exam/view/Home_screen.dart';
import 'package:exam_1/exam/view/Show_total.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => QuizProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => Home_screen(),
            "total": (context) => ShowTotalScreen(),
          },
        ),
      ),
    ),
  );

  //https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple
}
