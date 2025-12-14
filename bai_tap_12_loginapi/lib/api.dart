import 'package:bai_tap_12_loginapi/model/auth.dart';
import 'package:bai_tap_12_loginapi/model/infor.dart';
import 'package:dio/dio.dart';

class Api {
  var dio = Dio();
  Future<Auth?> login(String username, String password) async {
    try {
      const url = 'https://dummyjson.com/auth/login';
      final res = await dio.post(
        url,
        data: {'username': username, 'password': password},
        options: Options(validateStatus: (s) => s != null && s < 500),
      );
      if (res.statusCode == 200) return Auth.fromJson(res.data);
    } catch (e) {
      print("lỗi");
    }
    return null;
  }

  Future<Infor?> getInfor(String accessToken) async {
    try {
      // tham số đầu vào là accesstoken
      var url = 'https://dummyjson.com/auth/me';
      final res = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer ${accessToken}'},
          validateStatus: (s) => s != null && s < 500,
        ),
      );
      if (res.statusCode == 200) {
        return Infor.fromJson(res.data);
      }
    } catch (e) {
      print("GetInfor lỗi: $e");
    }
    return null;
  }
}
