import 'package:flutter/material.dart';
import 'package:splashgolfclub/class/golfCourse.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/components/holesDetails.dart';
import 'package:splashgolfclub/components/inwardOutwardImages.dart';
import 'package:splashgolfclub/components/priceTable.dart';
import 'package:splashgolfclub/components/tag.dart';

class GolfCourseDetailsPage extends StatelessWidget {
  final GolfCourse course;

  const GolfCourseDetailsPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> holes = List.generate(
      18,
          (index) => {
        'number': index + 1,
        'par': 4 + (index % 2),
        'stroke': index % 3,
        'distance': 300 + (index * 10),
      },
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), // Height of your custom header
            child: Header(title: course.title)),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
                  child: SizedBox(
                    width: 390,
                    height: 844,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              TagWidget(text: 'Holes: ${course.holes}'),
                              const SizedBox(width: 8),
                              TagWidget(text: 'Par: ${course.par}'),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(course.imagePath, fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            course.description,
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          SizedBox(height: 20),
                          PriceTable(title: "9-Hole Course Prices Per Golfer", prices: ["400", "400", "400", "400", "400", "400", "400"]),
                          SizedBox(height: 20),
                          PriceTable(title: "18-Hole Course Prices Per Golfer", prices: ["700", "700", "700", "700", "700", "700", "700"]),
                          SizedBox(height: 20),
                          SizedBox(height: 20),
                          ImageGrid(),
                          SizedBox(height: 20),
                          GolfHolesGrid(holes: holes),
                          SizedBox(height: 20),
                          Text(
                            "Golf Course Notes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(), // Horizontal line
                          SizedBox(height: 8),
                          Text(
                            "No notes available.",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Button size
                            ),
                            onPressed: () {

                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ))),
        ),
      ),
    );
  }
}
