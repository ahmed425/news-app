
import '../models/news.dart';

class NewsController {
  Future<List<News>> getNews() async {
    try {
      return await News.fetchNews();
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
