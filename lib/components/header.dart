import 'package:flutter/material.dart';
import 'package:splashgolfclub/screens/coursesPage.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashGolfClubAppCourse()), // Replace with your home page widget
              );
            },
            child: Row(
              children: [
                const Icon(Icons.sports_golf, size: 34.0, color: Colors.green),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.settings, size: 34.0),
        ],
      ),
    );
  }
}
