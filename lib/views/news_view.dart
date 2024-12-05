import 'package:flutter/material.dart';

import '../controllers/news_controller.dart';
import '../models/news.dart';


class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  NewsViewState createState() => NewsViewState();
}

class NewsViewState extends State<NewsView> {
  final NewsController _controller = NewsController();
  late Future<List<News>> _newsList;

  @override
  void initState() {
    super.initState();
    _newsList = _controller.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App (MVC)'),
      ),
      body: FutureBuilder<List<News>>(
        future: _newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news available'));
          } else {
            final newsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return Card(
                  child: ListTile(
                    leading: news.urlToImage.isNotEmpty
                        ? Image.network(news.urlToImage, width: 100, fit: BoxFit.cover)
                        : const Icon(Icons.image),
                    title: Text(news.title),
                    subtitle: Text(news.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    onTap: () {
                      _openNewsUrl(news.url);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _openNewsUrl(String url) {
    // Placeholder function to open URL
    // Use `url_launcher` package if needed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening: $url')),
    );
  }
}
