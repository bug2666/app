import 'package:flutter/material.dart';

class Classroom extends StatelessWidget {
  const Classroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classroom')),
      body: ListView(
        children: [block1(), block2(), block3(), block4(), block5()],
      ),
    );
  }
}

Widget block1() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("images/Honors.jpg"),
        fit: BoxFit.cover,
      ),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Xml và ứng dụng - Nhóm 1",
                style: TextStyle(fontSize: 25, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "2025-2026.1.TIN4583.001",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 40),
              Text("58 học viên", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget block2() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("images/img_reachout.jpg"),
        fit: BoxFit.cover,
      ),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lập trình ứng dụng cho các thiết bị di động",
                style: TextStyle(fontSize: 25, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "2025-2026.1.TIN4583.001",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 40),
              Text("58 học viên", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget block3() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("images/img_reachout.jpg"),
        fit: BoxFit.cover,
      ),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lập trình ứng dụng cho các thiết bị di động",
                style: TextStyle(fontSize: 25, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "2025-2026.1.TIN4583.001",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 40),
              Text("58 học viên", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget block4() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("images/Honors.jpg"),
        fit: BoxFit.cover,
      ),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lập trình cho các ứng dụng di động",
                style: TextStyle(fontSize: 25, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "2025-2026.1.TIN4583.001",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 40),
              Text("58 học viên", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget block5() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("images/Honors.jpg"),
        fit: BoxFit.cover,
      ),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lập trình ứng dụng cho các thiết bị di động",
                style: TextStyle(fontSize: 25, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "2025-2026.1.TIN4583.001",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 40),
              Text("58 học viên", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}
