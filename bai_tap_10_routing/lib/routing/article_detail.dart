import 'package:bai_tap_10_routing/routing/models/articles.dart';
import 'package:flutter/material.dart';



class ArticleDetail extends StatelessWidget {
  final Articles article;

  const ArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // contexx là trang trước
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh bài viết
              if (article.urlToImage.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(article.urlToImage),
                ),

              const SizedBox(height: 16),

              // Tiêu đề
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),
              // Nội dung bài viết
              Text(
                article
                        .content
                        .isNotEmpty // điều_kiện ? giá_trị_nếu_đúng : giá_trị_nếu_sai
                    ? article.content
                    : "Không có nội dung chi tiết.",
                style: const TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  // Không làm gì cả
                },
                child: const Text("Xem bài viết gốc"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
