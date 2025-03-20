import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/tag.dart';

class GolfCourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int holes;
  final int par;
  final String description;

  const GolfCourseCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.holes,
    required this.par,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  TagWidget(text: 'Holes: $holes'),
                  const SizedBox(width: 8),
                  TagWidget(text: 'Par: $par'),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              GestureDetector(
                child: const Text(
                  'See more...',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
