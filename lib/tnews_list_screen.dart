import 'package:flutter/material.dart';
import 'package:hoctap1/services/news_service.dart';
import 'package:hoctap1/model/article.dart';
import 'news_detail_screen.dart';

class NewsListScreen extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: newsService.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Lỗi tải dữ liệu"));
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];

              return ListTile(
                leading: SizedBox(
                  width: 56,
                  height: 56,
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image),
                  ),
                ),
                title: Text(article.title),
                subtitle: Text(article.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailScreen(article: article),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
