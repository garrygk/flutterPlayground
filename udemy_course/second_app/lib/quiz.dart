import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start';

  void switchScreen (){
    setState(() {
      activeScreen = 'questions';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'questions-screen';
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
          child:
            activeScreen == 'start' ? StartScreen(switchScreen) :
            activeScreen == 'questions' ? QuestionsScreen(chooseAnswer) :
            activeScreen == 'results' ? ResultsScreen(selectedAnswers, restartQuiz) :
            activeScreen == 'questions-screen' ? QuestionsScreen(chooseAnswer) : StartScreen(switchScreen),
        ),
      ),
    );
  }
}