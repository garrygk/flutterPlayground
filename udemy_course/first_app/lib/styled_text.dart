import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.receivedText, {super.key});

  final String receivedText;

  @override
  Widget build(BuildContext context) {
    return Text(
      receivedText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}