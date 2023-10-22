import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          firstColour: Color.fromARGB(255, 44, 38, 226),
          secondColour: Color.fromARGB(255, 18, 141, 49),
        ),
      ),
    ),
  );
}

