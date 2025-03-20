import 'package:flutter/material.dart';

class FAQAccordion extends StatelessWidget {
  final List<Map<String, String>> faqs;

  FAQAccordion({required this.faqs});

  @override
  Widget build(BuildContext context) {
    final defaultFaqs = [
      {
        'question': 'What is Flutter?',
        'answer': 'Flutter is an open-source UI software development kit created by Google.',
      },
      {
        'question': 'How do I install Flutter?',
        'answer': 'You can install Flutter by following the instructions on the official website.',
      },
      {
        'question': 'What is Dart?',
        'answer': 'Dart is the programming language used to build Flutter apps.',
      },
      {
        'question': 'What is a StatelessWidget?',
        'answer': 'A StatelessWidget is a widget that does not require mutable state.',
      },
      {
        'question': 'What is a StatefulWidget?',
        'answer': 'A StatefulWidget is a widget that has mutable state that can change during the lifetime of the widget.',
      },
    ];

    final faqList = faqs.isEmpty ? defaultFaqs : faqs;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FAQ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: faqList.map((faq) {
              return Theme(
                data: ThemeData(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.all(0),
                  title: Text(
                    faq['question'] ?? 'No Question',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        faq['answer'] ?? 'No Answer',
                      ),
                    ),
                  ],
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  backgroundColor: Colors.transparent,
                  shape: Border(
                    top: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
