import 'package:bai_tap_10_routing/routing/models/news.dart';
import 'package:dio/dio.dart';

class Api {
  Future<News> getAllNews() async { // đây không phải dạng list
    var dio = Dio();
    var apiKey = "ee85ce9bee014fe791d3c1bc5a3f263b";
    var url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=${apiKey}";
    var response = await dio.get(url);

    if(response.statusCode == 200){
     return News.fromJson(response.data);
    }
    else{
     throw Exception("Failed to load news. Status code: ${response.statusCode}");
    }
  }
}
var testAPI = Api();