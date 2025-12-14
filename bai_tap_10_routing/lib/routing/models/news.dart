import 'package:bai_tap_10_routing/routing/models/articles.dart';

class News {
  String status;
  int totalResults;
  List<Articles> articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      status:  json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: (json["articles"] as List).map((item) => Articles.fromJson(item)).toList(),
    );
  }

}