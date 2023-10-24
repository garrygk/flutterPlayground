import 'package:flutter/material.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/questions_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen (){
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 70, 12, 177),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 189, 75, 209),
                Color.fromARGB(255, 70, 12, 177)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}