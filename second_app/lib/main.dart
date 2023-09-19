import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Bar"),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('images/bub.png')
          ),
        ),
      ),
    );
  }
}