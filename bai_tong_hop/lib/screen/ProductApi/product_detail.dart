import 'package:bai_tong_hop/screen/ProductApi/models/product.dart';
import 'package:flutter/material.dart';


class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // IMAGE
              Center(
                child: Image.network(
                  product.image,
                  height: 180,
                ),
              ),

              SizedBox(height: 20),

              // TITLE
              Text(
                product.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // DESCRIPTION
              Text(
                product.description,
                style: TextStyle(fontSize: 14),
              ),

              SizedBox(height: 20),

              // PRICE
              Text(
                "Giá: ${product.price} \$",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),

              SizedBox(height: 10),

              // RATING
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 5),
                  Text(
                    "${product.rating.rate} (${product.rating.count})",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // TWO BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Đã thêm sản phẩm vào giỏ hàng")),
                        );
                      },
                      child: Text("Thêm vào giỏ"),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Đang tiến hành mua ngay")),
                        );
                      },
                      
                      child: Text("Mua ngay", style: TextStyle(color: Colors.red),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
