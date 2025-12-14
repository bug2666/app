import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String result = ''; // Để hiển thị kết quả

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      try {
        double height = double.parse(heightController.text) / 100; // chuyển cm sang mét
        double weight = double.parse(weightController.text);
        double bmiValue = weight / (height * height);

        String bmiCategory;
        if (bmiValue < 18.5) {
          bmiCategory = 'Thiếu cân';
        } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
          bmiCategory = 'Bình thường';
        } else if (bmiValue >= 25 && bmiValue <= 29.9) {
          bmiCategory = 'Thừa cân';
        } else {
          bmiCategory = 'Béo phì';
        }

        // Cập nhật kết quả
        setState(() {
          result = 'Chỉ số BMI của bạn là ${bmiValue.toStringAsFixed(2)} ($bmiCategory)';
        });

        // Hiển thị SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập chiều cao và cân nặng hợp lệ'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  MyAppBar() {
    return AppBar(
      title: const Text('Tính chỉ số BMI'),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: 'Nhập chiều cao (cm)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập chiều cao';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: 'Nhập cân nặng (kg)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập cân nặng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Tính BMI'),
              ),
              const SizedBox(height: 20),
              if (result.isNotEmpty) 
                Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
