import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/header.dart';

class BookingDetailsModel extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final String courseType;
  final String date;
  final String time;
  final int golfers;
  final int guests;
  final int caddies;
  final int carts;
  final int food;
  final int totalPrice;

  const BookingDetailsModel({
    Key? key,
    required this.courseName,
    required this.imagePath,
    required this.courseType,
    required this.date,
    required this.time,
    required this.golfers,
    required this.guests,
    required this.caddies,
    required this.carts,
    required this.food,
    required this.totalPrice,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), // Height of your custom header
          child: Header(title: 'SPLASH GOLF CLUB')),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(children: [
          Center(
            child: SizedBox(
              width: 390,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      color: Colors.white,
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
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
                                  'Booking Details',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(imagePath,
                                      width: 60, height: 60, fit: BoxFit.cover),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(courseName,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 4),
                                      Text(
                                          "52 347 Phahonyothin Rd, Tambon Lak Hok, Amphoe Mueang Pathum Thani",
                                          style: TextStyle(color: Colors.grey),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Divider(),
                            _buildDetailRow(
                                Icons.golf_course, 'Booking Type', courseType),
                            _buildDetailRow(Icons.calendar_today, 'Tee Date',
                                '${formatDate(date)}'),
                            _buildDetailRow(Icons.access_time, 'Tee Time',
                                '${formatTime(time, context)}'),
                            SizedBox(height: 12),
                            Divider(),
                            _buildDetailRow(
                                Icons.person, 'Golfers', '$golfers'),
                            _buildDetailRow(
                                Icons.group, 'Accompanying Persons', '$guests'),
                            _buildDetailRow(
                                Icons.shopping_cart, 'Caddies', '$caddies'),
                            _buildDetailRow(
                                Icons.local_taxi, 'Golf Carts', '$carts'),
                            _buildDetailRow(
                                Icons.fastfood, 'Food & Drinks', '$food'),
                            SizedBox(height: 12),
                            Divider(),
                            _buildDetailRow(Icons.attach_money, 'Total Price',
                                '$totalPrice THB',
                                isBold: true),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                child: Icon(Icons.arrow_right, color: Colors.white),
              )),
        ])),
      ),
    );
  }

  // Helper method for creating a row
  Widget _buildDetailRow(IconData icon, String label, String value,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.green[800]),
          SizedBox(width: 8),
          Text(label + ': ',
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Expanded(
            child: Text(value,
                style: TextStyle(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          ),
        ],
      ),
    );
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
}
