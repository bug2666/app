import 'package:bai_tong_hop/screen/routing/api.dart';
import 'package:flutter/material.dart';
import 'package:bai_tong_hop/screen/routing/article_detail.dart';
import 'package:bai_tong_hop/screen/routing/models/news.dart' as models;

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  models.NewsModel? newsData;

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    newsData = await testAPI.getAllNews();
    setState(() {});
  }

  PreferredSizeWidget myAppbar() {
    return AppBar(
      title: const Text("Danh sách bài viết"),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: newsData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsData!.articles.length,
              itemBuilder: (context, index) {
                final item = newsData!.articles[index];

                return ListTile(
                  leading: item.urlToImage.isNotEmpty
                      ? Image.network(
                          item.urlToImage,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.linked_camera, size: 40),

                  title: Text(item.title),
                  subtitle: Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetail(article: item),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
