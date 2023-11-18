import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(right: 13),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 73, 181, 239),
                      // shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text((data['question'] as String), style: const TextStyle(
                    color: Color.fromARGB(255, 207, 172, 236),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ), textAlign: TextAlign.left,),
                  const SizedBox(height: 5,),
                  Text((data['user_answer'] as String), style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 220, 131, 236),
                  ), textAlign: TextAlign.left,),
                  Text((data['correct_answer'] as String), style: const TextStyle(
                    color: Color.fromARGB(255, 106, 143, 222),
                    fontSize: 16,
                  ), textAlign: TextAlign.left,),
                  const SizedBox(height: 15,)
                ],),
              ),
            ],
            );
          }).toList(),
        ),
      ),
    );
  }
}