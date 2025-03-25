import 'package:flutter/material.dart';

class FAQAccordion extends StatelessWidget {
  final List<Map<String, String>> faqs;

  FAQAccordion({required this.faqs});

  @override
  Widget build(BuildContext context) {
    final defaultFaqs = [
      {
        'question': 'Why can\'t I book a tee time without an account?',
        'answer': 'Our golf club requires all users to register before booking to ensure a seamless experience and track reservations properly. Guest or visitor bookings are not allowed for simplicity.',
      },
      {
        'question': 'Can I reschedule my booking?',
        'answer': 'No, rescheduling, and refunds are not allowed once a booking is confirmed. Please make sure to check your availability before finalizing your reservation.',
      },
      {
        'question': 'Where can I find my booking details?',
        'answer': 'You can find all your booking details by clicking on the \'Profile\' button, going to your Account, and scrolling down to the \'Bookings\' section. This will display all your past and upcoming reservations.',
      },
      {
        'question': 'How can I know if my desired tee time is available?',
        'answer': 'You can check available tee times by navigating to the \'Book Tee Time\' section. If a tee time is already booked by another user, it will be locked and unavailable for selection. Only available slots will be shown for booking..',
      },
      {
        'question': 'Can I book golf lessons or instructors through the website?',
        'answer': 'No, our website does not offer online booking for golf lessons or instructors. However, when you arrive at the golf course, you can check in at the reception counter, where you may be able to arrange for an instructor based on availability.',
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
                color: Colors.green,
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
