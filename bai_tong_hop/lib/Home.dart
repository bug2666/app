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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
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
              ListTile(
                leading: const Icon(Icons.class_),
                title: const Text('Giao diện lớp học'),
                subtitle: const Text('Mở giao diện lớp học'),
                onTap: () {
                  Navigator.pop(context);
                  _openClassroom();
                },
              ),


              // bài 2
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Hiển thị ảnh'),
                subtitle: const Text('Giao diện hiển thị hình ảnh'),
                onTap: () {
                  Navigator.pop(context);
                  _bai2();
                }
              ),
              // bài 3
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Đổi màu giao diện'),
                subtitle: const Text('Giao diện đổi màu'),
                onTap: () {
                  Navigator.pop(context);
                  _change_color();
                }
              ),
              // bài 4
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Đếm'),
                subtitle: const Text('Giao diện Đếm'),
                onTap: () {
                  Navigator.pop(context);
                  _count();
                }
              ),
              // bài 5
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Trang đăng nhập'),
                subtitle: const Text('Giao diện đăng nhập'),
                onTap: () {
                  Navigator.pop(context);
                  _login();
                }
              ),

              // bài 6
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Trang đăng kí'),
                subtitle: const Text('Giao diện đăng kí'),
                onTap: () {
                  Navigator.pop(context);
                  _register();
                }
              ),
              // bài 7
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Giới thiệu nơi sinh sống'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _MyPlace();
                }
              ),
              // bài 8
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Tính chỉ số BMI'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _bmi();
                }
              ),
              // bài 9
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Đánh giá của khách hàng'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _Evaluate();
                }
              ),
              // bài 10
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Thao tác với API'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _News();
                }
              ),
              // bài 11
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Trang chủ bán hàng'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _MyProduct();
                }
              ),
              // bài 12
              const Divider(),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Login with API'),
                subtitle: const Text('Giao diện'),
                onTap: () {
                  Navigator.pop(context);
                  _LoginApi();
                }
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

  void _bai2(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Showimages()),
    );
  }

  void _change_color(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => change_color())
    );
  }

  void _count(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => count())
    );
  }


  void _login(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login())
    );
  }


  void _register () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => register())
    );
  }

  void _MyPlace(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPlace())
    );
  }

  void _bmi(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => bmi())
    );
  }

  void _Evaluate(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Evaluate())
    );
  }

  void _News(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => News())
    );
  }

  void _MyProduct(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProduct())
    );
  }

  void _LoginApi(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login())
    );
  }
}
