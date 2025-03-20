import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }
}
