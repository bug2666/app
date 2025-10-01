import 'package:flutter/material.dart';


// stl enter
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          // can lề trục chính
          // mainAxisAlignment:MainAxisAlignment.center , // can ra chính giưax
          //mainAxisAlignment:MainAxisAlignment.spaceAround, // can ra cách đều
          mainAxisAlignment:MainAxisAlignment.spaceEvenly, // cách ra cách đều nhau
          // can lề trục phụ
          crossAxisAlignment: CrossAxisAlignment.end, // can lề phải  
          children: [
            Center(child: Text(
              'hello', 
              style: TextStyle(color:Colors.lightBlueAccent, fontSize: 30),
            )
                  ),
                  Icon(Icons.heart_broken, color: Colors.red, size: 50,),
                  Text("lập trình ứng dụng di động", style: TextStyle(color: Colors.green, fontSize: 20),)
          ],
        ),
    );  
  }
}