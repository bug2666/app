
import 'package:bai_tong_hop/screen/ProductApi/models/product.dart';
import 'package:dio/dio.dart';



class Api { // hướng đối tượng vì trong lớp 
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products'; // mặc định nó là get
    var response = await dio.get(url); // delay để api trả về, hàm nào có await thì phải theo async để trở thành hàm bất đồng bộ
    // async là tạo luồng mới để xử lý riêng , nhưng số luồng này có hạn

    // khai báo danh sách rỗng kiểu Product
    List<Product> ls = [];
    if(response.statusCode == 200){
      //print(response.data);
      List data = response.data; // đặt json vào 1 mảng
      // ánh xạ
      ls = data.map((json) => Product.fromJson(json)).toList();
      return ls; // trả về danh sách
    } else {
      print("lỗi");
      return []; // trả về danh sách rỗng nếu lỗi
    }
  }
}
// hướng thủ tục , gọi lại class trên
var testAPI = Api();
