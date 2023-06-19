import 'package:flutter/material.dart';

class ShowTotalScreen extends StatefulWidget {
  const ShowTotalScreen({Key? key}) : super(key: key);

  @override
  State<ShowTotalScreen> createState() => _ShowTotalScreenState();
}

class _ShowTotalScreenState extends State<ShowTotalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Your Score is ",style: TextStyle(fontSize: 25,color: Colors.red),),
            Text("10",style: TextStyle(fontSize: 20,color: Colors.blue),),
            Text("Congrtulaton",style: TextStyle(fontSize: 25,color: Colors.red),),
          ],
        ),
      ),
    ),);
  }
}
