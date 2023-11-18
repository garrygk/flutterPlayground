import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/models/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.finalAnswers, {super.key});

  final List<String> finalAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < finalAnswers.length; i++) {
      // loop
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': finalAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final totalCorrect = summaryData.where((element) {
      return element['user_answer'] == element['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $totalCorrect out of $totalQuestions questions correctly!",
                style: const TextStyle(
                  color: Color.fromARGB(255, 207, 172, 236),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                // restartQuiz();
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!",),
            )
          ],
        ),
      ),
    );
  }
}
