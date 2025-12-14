import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Evaluate extends StatefulWidget {
  const Evaluate({super.key});

  @override
  State<Evaluate> createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  double rating = 0;

  void _checkValidate() {
    if (rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn số sao đánh giá'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phản hồi của bạn đã được gửi thành công!'),
          duration: Duration(seconds: 2),
        ),
      );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Họ và tên',
                  prefixIcon: Icon(Icons.person),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ và tên';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              const Text(
                "Đánh giá:",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  allowHalfRating: true,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: "Nội dung phản hồi",
                  prefixIcon: Icon(Icons.chat),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 50.0,   // tăng khoảng cách trên/dưới
                    horizontal: 16.0, // tăng khoảng cách trái/phải
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập nội dung";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _checkValidate,
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const Text("Gửi phản hồi"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text('Gửi phản hồi'),
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
