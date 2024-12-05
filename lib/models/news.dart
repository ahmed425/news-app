import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  News({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }

  static Future<List<News>> fetchNews() async {
    const String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=bfe9b431d33847ba9fb9292d12e15758';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> articles = json.decode(response.body)['articles'];
      return articles.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
