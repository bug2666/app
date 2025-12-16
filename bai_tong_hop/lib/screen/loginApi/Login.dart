import 'package:bai_tong_hop/screen/loginApi/api.dart';
import 'package:bai_tong_hop/screen/loginApi/profileInfor.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final userFrom = TextEditingController(); // lấy giá trị người dùng nhập vào
  final passFrom = TextEditingController();
  bool isLoading = false;
  String? errorText;

  @override
  void dispose() {
    userFrom.dispose();
    passFrom.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    final valid = formKey.currentState!
        .validate(); // kiểm tra form hiện tại (chắc chắn không null) có hợp lệ không
    if (!valid) return; // không hợp lệ
    final api = Api(); //Muốn gọi instance method thì phải tạo đối tượng trước.
    //Class là khuôn mẫu, instance là sản phẩm được tạo từ khuôn đó.
    setState(() {
      isLoading = true;
      errorText = null;
    });

    final auth = await api.login(
      // vì Future<Auth?> login(String username, String password) nên ta sẽ gọi như dưới
      userFrom.text.trim(),
      passFrom.text,
    );
    if (auth == null) {
      setState(() {
        isLoading = false;
        errorText = 'Sai tài khoản hoặc mật khẩu';
      });
      return;
    }
    final info = await api.getInfor(auth.accessToken);
    if (!mounted) return;
    if (info == null) {
      setState(() {
        isLoading = false;
        errorText = 'không lấy được thông tin người dùng';
      });
      return;
    }
    Navigator.pushReplacement(
      // push thì có thể quay lại vì nó để vào ngăng sếp còn pushReplacement thì thay thế màn hình hiện tại bằng màn hình mới , không thể quay lại màn hình trước nữa
      context, // màn hình gốc
      MaterialPageRoute(
        builder: (context) {
          return ProfileScreen(infor: info);
        },
      ),
      // builder: (context): yêu cầu tạo màn hình mới
      // context là BuildContext của route mới, không phải context của màn hình cũ.
      // truyền dữ liệu giữa 2 màn hình thông qua biến infor và nó được khai báo vào khởi tạo ở bên profileInfor
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// Username
                    TextFormField(
                      controller: userFrom,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Nhập username' : null,
                    ),
                    const SizedBox(height: 16),

                    /// Password
                    TextFormField(
                      controller: passFrom,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Nhập password' : null,
                    ),
                    const SizedBox(height: 16),

                    /// Error
                    if (errorText != null)
                      Text(
                        errorText!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 16),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
