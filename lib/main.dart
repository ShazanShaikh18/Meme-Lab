import 'package:flutter/material.dart';
import 'package:memes_app/view/mainscreen.dart';
import 'package:memes_app/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue),
      home: splashScreen(),
    );
  }
}
