import 'package:bai_tong_hop/screen/ProductApi/api.dart';
import 'package:bai_tong_hop/screen/ProductApi/models/product.dart';
import 'package:bai_tong_hop/screen/ProductApi/product_detail.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late final Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = testAPI.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text("Lỗi: ${snap.error}"));
          }
          if (!snap.hasData) {
            return const Center(child: Text("Không có dữ liệu"));
          }

          return myListViews(snap.data!);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
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
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () => handledTap(p),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(p.image, height: 75),
            const SizedBox(height: 10),
            Text(
              p.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              p.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 9),
            ),
            const SizedBox(height: 10),
            Text("${p.price} \$", style: const TextStyle(color: Colors.red)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 6),
                Text("${p.rating.rate} (${p.rating.count})"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handledTap(Product p) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(product: p),
      ),
    );
  }

  myAppbar() {
    return AppBar(
      title: const Text("Danh sách sản phẩm"),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
