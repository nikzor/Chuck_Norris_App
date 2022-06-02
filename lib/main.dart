import 'package:flutter/material.dart';
import 'screens/homewidget.dart';
import 'screens/tinderwidget.dart';
import 'screens/aboutwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (_) => const HomeWidget(),
        '/tinder': (_) => const TinderWidget(),
        '/about': (_) => const AboutWidget(),
      },
    );
  }
}
