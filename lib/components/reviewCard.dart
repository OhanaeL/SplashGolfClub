import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final int rating;
  final String reviewTitle;
  final String reviewText;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewTitle,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(date, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                const Spacer(),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < rating ? Colors.amber : Colors.grey[300],
                      size: 20,
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              reviewTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              reviewText,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}