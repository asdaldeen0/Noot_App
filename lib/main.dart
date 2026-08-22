import 'package:flutter/material.dart';
import 'package:note_app/view/screen/homeview.dart';
import 'package:note_app/view/screen/splashViwe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (context) => const Homeview()},
      debugShowCheckedModeBanner: false,
      home: const Splashviwe(),
    );
  }
}
