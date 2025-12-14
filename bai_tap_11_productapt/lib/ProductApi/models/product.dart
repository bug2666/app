

import 'package:bai_tap_11_productapt/ProductApi/models/Rating.dart';

class Product {
  int id;
  String title ;
  dynamic price ; // mọi kiểu dữ liệu, số, chữ...
  String description;
  String category;
  String image;
  Rating rating;

  // khai báo thêm rating

  Product ({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  }); // khởi tạo, dấu ngoặc là thứ tự không bắt uộc

  factory Product.fromJson(Map<String, dynamic> json){ // hàm có chức năng biến json về dạng String
    return Product(
      id: json['id'] ?? 0, // trường hợp giá trị đây bằng null thì lấy giá trị phía sau này còn không thì thôi
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: Rating.fromJson(json['rating']  ?? {} ),
    );
  }
}