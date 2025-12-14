import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Place')),
      body: SingleChildScrollView(
        child: Column(children: [block1(), block2(), block3(), block4()]),
      ),
    );
  }
}

Widget block1() {
  var src =
      'https://images.unsplash.com/photo-1755899850036-084006cbc1c2?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  return Image.network(src);
}

// block2 gồm 2 cột
Widget block2() {
  return Row(
    children: [
      Expanded(child: block22()),
      Expanded(child: block23()),
    ],
  );
}

Widget block22() {
  var title = "Tết Trung Thu";
  var desc = "Tết Trung Thu, còn được gọi là Tết Trông Trăng hay Tết Thiếu Nhi";
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  desc,
                  style: TextStyle(fontSize: 15),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget block23() {
  return Padding(
    padding: const EdgeInsets.all(50.0),
    child: Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.red),
              Text("4.5"),
            ],
          ),
        ],
      ),
    ),
  ); // là 1 dấu x
}

//
Widget block3() {
  return Row(
    children: [
      Expanded(child: block31()),
      Expanded(child: block32()),
      Expanded(child: block33()),
    ],
  );
}

Widget block31() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        children: [
          Icon(Icons.call, color: Colors.blue, size: 30),
          Text("Call"),
        ],
      ),
    ),
  ); // là 1 dấu x
}

Widget block32() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        children: [
          Icon(Icons.near_me, color: Colors.blue, size: 30),
          Text("Route"),
        ],
      ),
    ),
  ); // là 1 dấu x
}

Widget block33() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        children: [
          Icon(Icons.share, color: Colors.blue, size: 30),
          Text("Share"),
        ],
      ),
    ),
  ); // là 1 dấu x
}

// lá chỉ hiển thị nội dunng còn nó nằm ở đâu thì cành nó quyết định
Widget block4() {
  var data =
      "Tết Trung Thu, còn được gọi là Tết Trông Trăng hay Tết Thiếu Nhi, là một trong những lễ hội truyền thống quan trọng và vui tươi ở Việt Nam. Lễ hội này thường diễn ra vào rằm tháng Tám âm lịch – khi trăng tròn và sáng nhất trong năm. Đây là dịp đặc biệt để sum vầy gia đình, thể hiện tình yêu thương và dành sự quan tâm cho trẻ em.";
  return Center(
    child: Padding(
      // chuột trái chọn refactor -> extract widget
      padding: const EdgeInsets.all(20.0),
      child: Text(data),
    ),
  ); // là 1 dấu x
}
