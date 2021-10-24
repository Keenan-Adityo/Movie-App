import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/detail.dart';
import 'package:movie_app/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        'detail': (context) =>
            DetailScreen(ModalRoute.of(context)!.settings.arguments),
      },
      home: HomeScreen(),
    );
  }
}
