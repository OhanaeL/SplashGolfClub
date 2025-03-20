import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const ImageCard({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // Set the radius for rounded corners
          child: Image.asset(
            imagePath,
            width: 160,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
