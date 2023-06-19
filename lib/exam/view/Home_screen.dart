import 'package:exam_1/exam/model/quiz_model.dart';
import 'package:exam_1/exam/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  QuizProvider? providerF;
  QuizProvider? providerT;

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<QuizProvider>(context, listen: false).apiDataParsing();
  // }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<QuizProvider>(context, listen: false);
    providerT = Provider.of<QuizProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              "Quiz App",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          body: FutureBuilder(
            future: providerF!.apiDataParsing(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                QuizModel? q1 = snapshot.data;

                return Column(
                  children: [
                    Container(
                      height: 35.h,
                      width: 100.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              "Q . ${providerT!.i+1}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "${q1!.results![providerT!.i].question}",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                        onTap: () {
                          providerF!.changQustion();
                        },
                        child: option(
                            "A", "${q1.results![providerT!.i].correctAnswer}")),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                        onTap: () {
                          providerF!.changQustion();
                        },
                        child: option("B",
                            "${q1.results![providerT!.i].incorrectAnswers![0]}")),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                        onTap: () {
                          providerF!.changQustion();
                        },
                        child: option("C",
                            "${q1.results![providerT!.i].incorrectAnswers![1]}")),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                        onTap: () {
                          providerF!.changQustion();
                        },
                        child: option("D",
                            "${q1.results![providerT!.i].incorrectAnswers![2]}")),
                    SizedBox(height: 3.h,),
                    Visibility(
                        visible: providerT!.a,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "total");
                          },
                          child: Container(
                      height: 7.h,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade50,
                      ),
                      alignment: Alignment.center,
                      child: Text("Show Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                        ))
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }

  Widget option(String op, String ans) {
    return Container(
      height: 7.h,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.blue.shade50,
          border: Border.all(color: Colors.blue, width: 2)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              "$op .",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "$ans",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
