// import thư viện
import 'package:bai_tap_9/feedback.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(MyApp());
}

// stl enter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Evaluate(),
      //home: MyProduct(),
      //home: News(),
    );
  }
}