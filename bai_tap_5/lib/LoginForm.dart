import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String correctUsername = 'nguyendung';
  final String correctPassword = '123456';
  final TextEditingController _usernameController = TextEditingController(); // lấy dữ liệu khi ấn login
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // 👈 biến lưu trạng thái ẩn/hiện


  // Hàm xử lý đăng nhập
  void _handleLogin() {
    FocusScope.of(context).unfocus(); // ẩn bàn phím
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      if (username == correctUsername && password == correctPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng nhập thành công'),
            duration: Duration(seconds: 2), // thời gian hiển thị
            behavior: SnackBarBehavior.floating, // nổi lên (tùy chọn)
            ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tên người dùng hoặc mật khẩu không đúng'),
            duration: Duration(seconds: 2), // thời gian hiển thị
            behavior: SnackBarBehavior.floating, // nổi lên (tùy chọn)
            ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(  // thêm border cho đẹp
                  labelText: 'Tên người dùng',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleLogin, // gọi hàm xử lý đăng nhập
                child: const Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  myAppBar(){
    return AppBar(
      title: Text("Ứng dụng đăng nhập"),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }


}