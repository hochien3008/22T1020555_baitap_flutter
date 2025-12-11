import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hoctap1/model/article.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({super.key, required this.article});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl.isNotEmpty)
              Image.network(
                article.imageUrl,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 120),
              ),

            SizedBox(height: 12),
            Text(article.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            SizedBox(height: 12),
            Text(article.content),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _openUrl(article.url),
              child: Center(child: Text("Mở bài viết gốc")),
            )
          ],
        ),
      ),
    );
  }
}