import 'package:flutter/material.dart';
import 'package:splashgolfclub/class/golfCourse.dart';
import 'package:splashgolfclub/components/golfCourseCard.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/courseDetails.dart';

void main() {
  runApp(SplashGolfClubAppCourse());
}

class SplashGolfClubAppCourse extends StatelessWidget {
  List<GolfCourse> golfCourses = [
    GolfCourse(
      imagePath: 'assets/golfclubPlaceholder.png',
      title: 'Hackathon',
      holes: 18,
      par: 72,
      description:
          'Nestled in the heart of lush greenery, Hackathon Golf Course offers an exceptional golfing experience for players of all skill levels. This 18-hole, par-72 championship course is designed to challenge and inspire, featuring strategically placed bunkers, rolling fairways, and scenic water hazards. With a picturesque landscape and meticulously maintained greens, golfers can enjoy a serene yet competitive round of golf.',
    ),
    GolfCourse(
      imagePath: 'assets/golfclubPlaceholder.png',
      title: 'Course Number Two',
      holes: 18,
      par: 72,
      description: 'Nestled in the heart of lush greenery, Hackathon Golf Course offers an exceptional golfing experience for players of all skill levels. This 18-hole, par-72 championship course is designed to challenge and inspire, featuring strategically placed bunkers, rolling fairways, and scenic water hazards. With a picturesque landscape and meticulously maintained greens, golfers can enjoy a serene yet competitive round of golf.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), // Height of your custom header
            child: Header(title: 'SPLASH GOLF CLUB')),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
                child: SizedBox(
            width: 390,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Discover Our Golf Courses',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      "We offer a wide selection of beautifully designed golf courses that cater to players of all skill levels. Whether you are looking for a challenging championship course or a relaxing day on the links, our courses promise an unforgettable experience. Our facilities include stunning fairways, state-of-the-art driving ranges, and clubhouses equipped with everything you need for a great round of golf.",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "Explore our courses below and find the perfect course for your next round!",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),
                  ...golfCourses.map((course) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GolfCourseDetailsPage(course: course),
                          ),
                        );
                      },
                      child: GolfCourseCard(
                        imagePath: course.imagePath,
                        title: course.title,
                        holes: course.holes,
                        par: course.par,
                        description: course.description,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ))),
        ),
      ),
    );
  }
}
