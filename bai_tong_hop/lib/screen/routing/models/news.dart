import 'package:bai_tong_hop/screen/routing/models/articles.dart';

class NewsModel {
  String status;
  int totalResults;
  List<Articles> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status:  json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: (json["articles"] as List? ?? [])
          .map((item) => Articles.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

}
