import 'package:flutter/material.dart';
//import 'package:flutter_application_1/my_home_page.dart';
import 'package:flutter_application_1/my_place.dart';
void main(){
  runApp(MyApp());
}

// stl enter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyHomePage(),
      home: MyPlace(),
    );
  }
}