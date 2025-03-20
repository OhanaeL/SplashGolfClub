import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/imageCard.dart';

class ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> gridItems = [
      {"image": "assets/holes1.png", "label": "Outward Holes"},
      {"image": "assets/holes2.png", "label": "Inward Holes"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: gridItems.map((item) {
        return ImageCard(imagePath: item["image"]!, label: item["label"]!);
      }).toList(),
    );
  }
}
