import 'package:flutter/material.dart';
import 'dart:math';


class count extends StatefulWidget {
  const count({super.key});

  @override
  State<count> createState() => _countState();
}


class _countState extends State<count> {

  late int current_count;
  Color current_color = Colors.white;

  List <Color> items = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.yellow];

  @override
  void initState() {
    super.initState();
    current_count = 0;
  }

  void increase_count(){
    setState(() {
      current_count += 1;
    });
    random_color();
  }

  void decrease_count(){
    setState(() {
      current_count -= 1;
    });
    random_color();
  }

  void reset_count(){
    setState(() {
      current_count = 0;
    });
    current_color = Colors.black;
  }

  void random_color() {
    var random = Random(); // tạo đối tượng Random
    setState(() {
      current_color = items[random.nextInt(items.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppaBar(),
        body: myBody(),
      )
    );
  }
  myAppaBar(){
    return AppBar(
      title: Text("Ứng dụng đếm số"),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  } 

  myBody(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // can theo trục dọc
        children: [
          Text("Giá trị hiện tại", style: TextStyle(fontSize: 30),),

          Padding(padding:  EdgeInsets.all(10)),

          Text("$current_count", style: TextStyle(fontSize: 50, color: current_color),),
          Padding(padding:  EdgeInsets.all(10)),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center, // can theo trục ngang
            children: [

              Padding(padding:  EdgeInsets.all(10)),

              ElevatedButton(
                onPressed: decrease_count,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("- Giảm", style:TextStyle(color: Colors.white, fontSize: 15),),
              ),

              Padding(padding:  EdgeInsets.all(10)),

              ElevatedButton(
                onPressed: reset_count,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text("↻ Đặt lại", style:TextStyle(color: Colors.white, fontSize: 15),),
              ),
              Padding(padding:  EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: increase_count,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("+ Tăng", style:TextStyle(color: Colors.white, fontSize: 15),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}