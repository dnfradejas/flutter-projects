import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});  
  

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState((){
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState((){
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState((){
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }
  
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,
      onRestart: restartQuiz);
    }

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 47, 7, 116),
              Color.fromARGB(255, 43, 11, 99),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, 
          ),
          ),
           child: screenWidget,
        ),

      )

    );
  
  }
}