
import 'package:bai_tap_11_productapt/ProductApi/api.dart';
import 'package:bai_tap_11_productapt/ProductApi/models/product.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  void initState() {
    super.initState();
    testAPI.getAllProduct(); // gọi API 1 lần duy nhất khi màn hình load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: FutureBuilder(
        future: testAPI.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return myListViews(snap.data!);
          } else {
            return CircularProgressIndicator(); // giao diện loadding
          }
        },
      ),
    );
  }

  Widget myListViews(List<Product> ls) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: ls.map((p) => myItem(p)).toList(),
    );
  }

  Widget myItem(Product p) {
    // p chứa tất cả dữ liệu api đã lấy về p.id
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        handledTap(p);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(p.image, height: 75),
            SizedBox(height: 10),
            Text(
              p.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // mô tả
            SizedBox(height: 8),
            Text(
              p.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 9),
            ),
            //
            SizedBox(height: 10),
            Text("${p.price} \$", style: TextStyle(color: Colors.red)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(height: 10),
                Text("${p.rating.rate} (${p.rating.count})"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handledTap(Product p) {
    print("đã ấn ${p.id}");
  }

  myAppbar(){
    return AppBar(
    title: Text("Danh sách sản phẩm"),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
