// import thư viện
import 'package:flutter/material.dart';
import 'Home.dart';

void main(){
  runApp(const MyApp());
}

// stl enter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Home(),
    );
  }
}
