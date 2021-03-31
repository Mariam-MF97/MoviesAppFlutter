import 'package:flutter/material.dart';
import 'package:movies_app/screens/home.dart';
import 'package:movies_app/screens/movie/movie_view.dart';
import 'package:movies_app/screens/movie_details/movie_details_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/movie': (context) => MovieView(),
        '/details': (context) => MovieDetailsView()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: MyHomePage(),
    );
  }
}
