import 'package:flutter/material.dart';
import 'views/news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App (MVC)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsView(),
    );
  }
}
