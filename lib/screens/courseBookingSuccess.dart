import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/coursesPage.dart';
import 'package:splashgolfclub/screens/profilePage.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String courseName;
  final String courseType;
  final String date;
  final String time;
  final int golfers;
  final int guests;
  final int caddies;
  final int carts;
  final int food;
  final int total;

  const BookingConfirmationScreen({
    Key? key,
    required this.courseName,
    required this.courseType,
    required this.date,
    required this.time,
    required this.golfers,
    required this.guests,
    required this.caddies,
    required this.carts,
    required this.food,
    required this.total,
  }) : super(key: key);


  String formatDate(dynamic date) {
    if (date is DateTime) {
      return _formatDate(date);
    } else if (date is String) {
      return date;
    } else {
      return 'Invalid date format';
    }
  }

  String formatTime(dynamic time, BuildContext context) {
    if (time is TimeOfDay) {
      return time.format(context);
    } else if (time is String) {
      return time;
    } else {
      return 'Invalid time format';
    }
  }



  String _formatDate(DateTime date) {
    return '${_getWeekday(date.weekday)}, ${_getMonth(date.month)} ${date.day}, ${date.year}';
  }

  String _getWeekday(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
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
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Container(
                                      width: 400,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.green[800],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Your Booking was Successful!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(courseName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        Text("52 347 Phahonyothin Rd, Tambon Lak Hok, Amphoe Mueang Pathum Thani", style: TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Column(
                                      children: [
                                        buildInfoRow(Icons.golf_course, 'Type', courseType),
                                        buildInfoRow(Icons.calendar_today, 'Date', formatDate(date)),
                                        buildInfoRow(Icons.access_time, 'Time', formatTime(time, context)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 50,
                                      children: [
                                        Column(
                                          children: [
                                            buildInfoRow(Icons.person, 'Golfers', golfers.toString()),
                                            buildInfoRow(Icons.people, 'Guests', guests.toString()),
                                            buildInfoRow(Icons.backpack, 'Caddies', guests.toString()),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            buildInfoRow(Icons.local_taxi, 'Carts', carts.toString()),
                                            buildInfoRow(Icons.fastfood, 'Food', food.toString()),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('฿ Total: $total THB',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Center(
                                    child:
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[800], // Button color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10), // Rounded corners
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18), // Button size
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Back to Profile",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text('Booking ID: #000000', style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            )
                        ),
                      )
                  ),

                  Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height * 0.4, // Adjust position
                      child: FloatingActionButton(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(16)),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_left, color: Colors.white),
                      )),
                ],
              )
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[800]),
          SizedBox(width: 8),
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
