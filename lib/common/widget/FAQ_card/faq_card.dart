import 'package:flutter/material.dart';

class FAQWidget extends StatelessWidget {
  final String question;
  final String answer;

  const FAQWidget({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:  const Color.fromRGBO(227, 224, 224, 1), // Set to your desired background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none, // No underline
            ),
          ),
          const SizedBox(height: 10),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none, // No underline
            ),
          ),
        ],
      ),
    );
  }
}
