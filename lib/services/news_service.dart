import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hoctap1/model/article.dart';

class NewsService {
  final String apiKey = "e3d9918034f0433892ecbc5af53f3667";

  Future<List<Article>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
