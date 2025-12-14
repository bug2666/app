import 'dart:math';
import 'package:flutter/material.dart';

// đây là lớp quản lý trạng thái
class change_color extends StatefulWidget {
  const change_color({super.key});

  @override
  State<change_color> createState() => _change_colorState();
}

// đây là lớp trạng thái (chú ý hàm này)
class _change_colorState extends State<change_color> {
  late Color current_color; // khai báo trước và hiện tại nó đang null
  Map<Color, String> colorMap = {
    Colors.purple: "Tím",
    Colors.orange: "Cam",
    Colors.green: "Xanh lá",
    Colors.blue: "Xanh dương",
  };

  @override
  void initState() {
    super.initState();
    current_color = Colors.purple; // gán màu tím cho biến hiện tại
  }

  // hàm đổi màu ngẫu nhiên
  void change_color() {
    var random = Random();
    var colorList = colorMap.keys.toList();

    setState(() {
      current_color = colorList[random.nextInt(colorList.length)];
    });
  }

  // hàm reset về màu tím
  void reset_color() {
    setState(() {
      current_color = Colors.purple;
    });
  }

  // CHỊU TRÁCH NHIỆM XÂY DỰNG GIAO DIỆN
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: myAppaBar(), body: myBody()),
    );
  }

  myAppaBar() {
    return AppBar(
      title: const Text("Ứng dụng thay đổi màu"),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  myBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: current_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // canh giữa dọc
        crossAxisAlignment: CrossAxisAlignment.center, // canh giữa ngang
        children: [
          const Text(
            "Màu hiện tại:",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            colorMap[current_color] ?? "chưa xác định",
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // căn giữa hàng
            children: [
              ElevatedButton.icon(
                onPressed: change_color, // đổi màu
                icon: const Icon(Icons.color_lens),
                label: const Text("Đổi màu"),
              ),
              const SizedBox(width: 15), // khoảng cách giữa nút
              ElevatedButton.icon(
                onPressed: reset_color, // ✅ nút reset hoạt động
                icon: const Icon(Icons.refresh),
                label: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
