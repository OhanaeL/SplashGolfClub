import 'package:flutter/material.dart';
import 'package:splashgolfclub/screens/coursesPage.dart';
import 'package:splashgolfclub/screens/homePage.dart';
import 'package:splashgolfclub/screens/loginPage.dart';
import 'package:splashgolfclub/screens/profilePage.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Header({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(80.0); // Define the height of the AppBar

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
                MaterialPageRoute(builder: (context) => SplashGolfClubApp()),
              );
            },
            child: Row(
              children: [
                Container(
                  width: 50.0, // Adjust width
                  height: 50.0, // Adjust height
                  child: Image.asset(
                    'assets/favicon.webp',
                    fit: BoxFit.contain,  // Maintains aspect ratio
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Row(
              children: [
                const Icon(Icons.person, size: 34.0, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
