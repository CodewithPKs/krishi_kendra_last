import 'package:flutter/material.dart';

import '../../List/FAQs_List/faq_list.dart';
import '../../common/widget/FAQ_card/faq_card.dart';


class FAQListScreen extends StatelessWidget {
  const FAQListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 250, 1),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('FAQ', style: TextStyle(color: Colors.white),),
        ),
      body:  SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30,),

            const Text(
              'FAQ (Frequently Asked Questions)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),

            const SizedBox(height: 30,),

            ListView.builder(
              shrinkWrap: true, // Added shrinkWrap to fix unbounded height
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: FAQs.length,
              itemBuilder: (context, index) {
                return FAQWidget(
                  question: FAQs[index]['Question'],
                  answer: FAQs[index]['Answer'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}