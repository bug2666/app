import 'package:flutter/material.dart';

class Showimages extends StatelessWidget {
  const Showimages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classroom')),
      backgroundColor: Colors.white,
      body: SafeArea(
        // ✅ tránh đè lên thanh trạng thái
        child: SingleChildScrollView(
          child: Column(
            children: [
              block1(),
              block2(),
              block3(),
              SizedBox(height: 20),
              block4(),
              SizedBox(height: 10),
              block5(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

//
// 🔹 BLOCK 1 - ICONS (Góc phải)
//
Widget block1() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [Expanded(child: block11())],
    ),
  );
}

Widget iconBox(IconData iconData) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Icon(iconData, size: 24, color: Colors.black),
  );
}

Widget block11() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      iconBox(Icons.notifications),
      SizedBox(width: 8),
      iconBox(Icons.extension),
    ],
  );
}

//
// 🔹 BLOCK 2 - WELCOME TEXT
//
Widget block2() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Welcome,",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text("Challenge", style: TextStyle(color: Colors.black, fontSize: 30)),
      ],
    ),
  );
}

//
// 🔹 BLOCK 3 - SEARCH BOX
//
Widget block3() {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: Colors.blue),
        border: InputBorder.none,
      ),
    ),
  );
}

//
// 🔹 BLOCK 4 - SAVED PLACES TITLE
//
Widget block4() {
  const String title = "Saved Places";
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: const [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

//
// 🔹 BLOCK 5 - GRID OF IMAGES
//
Widget block5() {
  final List<String> images = [
    'images/anh-phong-canh-dep-2.jpg',
    'images/anh-phong-canh-dep-3.jpg',
    'images/anh-phong-canh-dep-4.jpg',
    'images/anh-phong-canh-dep-5.jpg',
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GridView.builder(
      shrinkWrap: true, // ✅ co theo nội dung
      physics: const NeverScrollableScrollPhysics(), // ✅ không cuộn riêng
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1, // ✅ tỉ lệ 1:1 vuông
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
        );
      },
    ),
  );
}
