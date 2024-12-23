import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  ),

              const SizedBox(height: 30),

              // call question_sumamry
              QuestionsSummary(summaryData),
              
              const SizedBox(height: 30),
              
              TextButton.icon(
                onPressed: onRestart,
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white, // Set icon color to white
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Set the primary color to white
                ),
              )
            ],
          )),
    );
  }
}
