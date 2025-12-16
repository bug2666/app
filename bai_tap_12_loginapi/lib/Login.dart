import 'package:bai_tap_12_loginapi/api.dart';
import 'package:bai_tap_12_loginapi/profileInfor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    final valid  = formKey.currentState!.validate(); // kiểm tra form hiện tại (chắc chắn không null) có hợp lệ không
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
    if (auth == null){
      setState(() {
        isLoading = false;
        errorText = 'Sai tài khoản hoặc mật khẩu';
      });
      return;
    }
    final info = await api.getInfor(auth.accessToken);
    if (!mounted) return;
    if(info == null){
      setState(() {
        isLoading = false;
        errorText = 'không lấy được thông tin người dùng';
      });
      return;
    }
    setState(() {
      isLoading = false;
      errorText = null;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context){return ProfileScreen(infor: info);}),
    );


  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () async {
            final popped = await Navigator.of(context).maybePop();
            if (!popped) {
              SystemNavigator.pop();
            }
          },
        ),
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: userFrom,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (v) => (v == null || v.isEmpty) ? 'Nhập username' : null,
              ),
              TextFormField(
                controller: passFrom,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) => (v == null || v.isEmpty) ? 'Nhập password' : null,
              ),
              const SizedBox(height: 12),
              if (errorText != null) Text(errorText!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: isLoading ? null : submit,
                child: isLoading
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
