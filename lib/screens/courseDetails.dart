import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashgolfclub/class/golfCourse.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/components/holesDetails.dart';
import 'package:splashgolfclub/components/inwardOutwardImages.dart';
import 'package:splashgolfclub/components/priceTable.dart';
import 'package:splashgolfclub/components/tag.dart';
import 'package:splashgolfclub/screens/bookingDetailsModel.dart';
import 'package:splashgolfclub/screens/courseBookingTeeTime.dart';
import 'package:splashgolfclub/screens/loginPage.dart';

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
        appBar: Header(title: 'SPLASH GOLF CLUB'),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Stack(
                children: [
              Center(
              child: SizedBox(
              width: 390,
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
                          backgroundColor: Colors.green[800], // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18), // Button size
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          int? savedUserID = prefs.getInt('userID');
                          print(savedUserID);
                          if (savedUserID != null){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookingScreen(
                                      courseId: course.courseId,
                                      courseName: course.title,
                                      imagePath: course.imagePath,
                                    ),
                              ),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          }
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
              )),
              Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.4, // Adjust position
                  child: FloatingActionButton(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailsModel(
                            courseName: course.title,
                            imagePath: course.imagePath,
                            courseType: "Select Booking Type",
                            date: "Select Booking Date",
                            time: "Select Tee Time",
                            golfers: 1,
                            guests: 0,
                            caddies: 0,
                            carts: 0,
                            food: 0,
                            totalPrice: 0,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_left, color: Colors.white),
                )),
              ]),
              ),
        ),
      ),
    );
  }
}
