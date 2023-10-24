import 'package:flutter/material.dart';
import 'package:second_app/quiz.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
