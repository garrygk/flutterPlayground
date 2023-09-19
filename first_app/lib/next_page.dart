import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
      ),
      backgroundColor: Colors.blue,
    );
  }
}