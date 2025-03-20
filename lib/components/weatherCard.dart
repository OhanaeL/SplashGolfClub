import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String description;

  const WeatherCard({
    Key? key,
    required this.day,
    required this.temperature,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            temperature,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
