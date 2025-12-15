import 'package:bai_tong_hop/screen/BMI.dart';
import 'package:bai_tong_hop/screen/LoginForm.dart';
import 'package:bai_tong_hop/screen/MyPlace.dart';
import 'package:bai_tong_hop/screen/ProductApi/my_product.dart';
import 'package:bai_tong_hop/screen/Register.dart';
import 'package:bai_tong_hop/screen/ShowImages.dart';
import 'package:bai_tong_hop/screen/changeColor.dart';
import 'package:bai_tong_hop/screen/count.dart';
import 'package:bai_tong_hop/screen/feedback.dart';
import 'package:bai_tong_hop/screen/loginApi/Login.dart';
import 'package:bai_tong_hop/screen/routing/routing.dart';
import 'package:flutter/material.dart';
import 'screen/ClassRoom.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Future<void> openGithub(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Không mở được $uri';
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      // Drawer shows the exercise list; first item opens the Classroom screen.
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Danh sách bài tập',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              // bài 1
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 1: Giao diện lớp học',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_1'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _openClassroom();
                  },
                ),
              ),
              // bài 2
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 2: Hiển thị ảnh',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_2'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _bai2();
                  },
                ),
              ),

              // bài 3
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 3: Đổi màu giao diện',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_3'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _change_color();
                  },
                ),
              ),
              // bài 4
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 4: Đếm',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_4'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _count();
                  },
                ),
              ),
              // bài 5
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 5: Trang đăng nhập',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_5'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _login();
                  },
                ),
              ),
              // bài 6
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 6: Trang đăng kí',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_6'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _register();
                  },
                ),
              ),
              // bài 7
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 7: Giới thiệu nơi sinh sống',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_7'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _MyPlace();
                  },
                ),
              ),
              // bài 8
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 8: Tính chỉ số BMI',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_8'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _bmi();
                  },
                ),
              ),
              // bài 9
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 9: Đánh giá của khách hàng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_9'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _Evaluate();
                  },
                ),
              ),
              // bài 10
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 10: Thao tác với API',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_10_routing'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _News();
                  },
                ),
              ),
              // bài 11
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 11: Trang chủ bán hàng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_11_productapt'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _MyProduct();
                  },
                ),
              ),
              // bài 12
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: Colors.blue, width: 4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.image, color: Colors.blue),
                  title: const Text(
                    'Bài 12: Login with API',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.code),
                    tooltip: 'Xem mã nguồn từ GitHub',
                    onPressed: () => openGithub('https://github.com/bug2666/app/tree/d9f504481aa962575e5d3dd5541e3cf90cea632c/bai_tap_12_loginapi'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _LoginApi();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.menu_book, size: 80, color: Colors.indigo),
              SizedBox(height: 16),
              Text(
                'Chọn menu bên trái để mở bài tập',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openClassroom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Classroom()),
    );
  }

  void _bai2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Showimages()),
    );
  }

  void _change_color() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => change_color()),
    );
  }

  void _count() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => count()));
  }

  void _login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => register()),
    );
  }

  void _MyPlace() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlace()));
  }

  void _bmi() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => bmi()));
  }

  void _Evaluate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Evaluate()),
    );
  }

  void _News() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
  }

  void _MyProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProduct()),
    );
  }

  void _LoginApi() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
