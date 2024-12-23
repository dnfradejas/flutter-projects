import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to top
              mainAxisAlignment: MainAxisAlignment.start, // Align to left     
                       
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: data['user_answer'] == data['correct_answer'] ? const Color.fromARGB(255, 114, 148, 218) : const Color.fromARGB(255, 244, 54, 120),
                  child: Text(((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(color: Colors.black)),
                ),
                Expanded(
                  child: Padding(  
                    padding: const EdgeInsets.only(left: 10,top: 5),


                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String, 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 192, 241),
                            fontSize: 15,
                          ),
                        ),
                        Text(data['correct_answer'] as String,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 172, 183, 252),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
