import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/faqAccordian.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/components/reviewCard.dart';
import 'package:splashgolfclub/components/weatherCard.dart';
import 'package:splashgolfclub/screens/coursesPage.dart';

void main() {
  runApp(SplashGolfClubApp());
}

class SplashGolfClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), // Height of your custom header
            child: Header(title: 'SPLASH GOLF CLUB')
        ),
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
                        'Always Ready Just Like Your Best Swing',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Streamline your golf experience with Splash Golf Club\'s intuitive online booking platform. Enjoy real-time tee time availability, secure member access, and a hassle-free reservation process.',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SplashGolfClubAppCourse()), // Replace with your home page widget
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Book a Tee Time',
                                  style: TextStyle(color: Colors.white),

                                ),
                                Icon(Icons.arrow_right, size: 32.0, color: Colors.white), ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Container(
                        width: 350,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.cloud, size: 32.0, color: Colors.grey),
                                SizedBox(width: 8.0),
                                Text(
                                  '29°C  Cloudy',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Playing Conditions\nGood',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 14, color: Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildWeatherInfo('Wind', '17 km/h NE'),
                                _buildWeatherInfo('Humidity', '71%'),
                                _buildWeatherInfo('Visibility', '10 km'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Plan Your Week Ahead on Our Course',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Stay updated with the weather forecast for the next week.',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      SizedBox(height: 12),
                      SingleChildScrollView(
                          padding: EdgeInsets.all(5.0),
                          scrollDirection: Axis.horizontal,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WeatherCard(day: 'Mon', temperature: '22°C', description: 'Partly Cloudy'),
                              WeatherCard(day: 'Tue', temperature: '19°C', description: 'Sunny'),
                              WeatherCard(day: 'Wed', temperature: '22°C', description: 'Partly Cloudy'),
                              WeatherCard(day: 'Thu', temperature: '19°C', description: 'Sunny'),
                              WeatherCard(day: 'Fri', temperature: '22°C', description: 'Partly Cloudy'),
                              WeatherCard(day: 'Sat', temperature: '19°C', description: 'Sunny'),
                              WeatherCard(day: 'Sun', temperature: '22°C', description: 'Partly Cloudy'),
                            ],
                          )
                      ),

                      SizedBox(height: 24),
                      FAQAccordion(faqs: [
                      ]),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'What Our Customers Say',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16),
                          ReviewCard(
                            name: "Thomas Anderson",
                            date: "July 15, 2024",
                            rating: 5,
                            reviewTitle: "Quick and easy booking",
                            reviewText:
                            "Booked my tee time in minutes! The course was exactly as described and the weather forecast feature helped me.",
                          ),
                          SizedBox(height: 10),
                          ReviewCard(
                            name: "Sarah Mitchell",
                            date: "August 22, 2024",
                            rating: 4,
                            reviewTitle: "Great mobile experience",
                            reviewText:
                            "Love the mobile app. Course descriptions are detailed and helpful. Would like more payment options though.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            )
          ),
        ),
      ),
    );
  }

  // Weather Info Widget
  Widget _buildWeatherInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
