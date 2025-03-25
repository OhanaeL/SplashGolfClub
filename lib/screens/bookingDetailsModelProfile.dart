import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingDetailsModelProfile extends StatefulWidget {
  final String courseName;
  final int courseType;
  final int date;
  final int time;
  final int golfers;
  final int guests;
  final int caddies;
  final int carts;
  final int food;
  final int totalPrice;
  final String paymentType;
  final int paidAmount;
  final String status;

  const BookingDetailsModelProfile({
    Key? key,
    required this.status,
    required this.courseName,
    required this.courseType,
    required this.date,
    required this.time,
    required this.golfers,
    required this.guests,
    required this.caddies,
    required this.carts,
    required this.food,
    required this.paymentType,
    required this.paidAmount,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _BookingDetailsModelProfileState createState() => _BookingDetailsModelProfileState();
}

class _BookingDetailsModelProfileState extends State<BookingDetailsModelProfile> {

  String convertToTime(int minutes) {
    final DateTime now = DateTime(2025, 3, 22, 0, 0);
    final DateTime time = now.add(Duration(minutes: minutes));
    return DateFormat('h:mm a').format(time);
  }
  String julianDateToReadableFormat(int julianDate) {
    // Base date: December 30, 1899
    DateTime baseDate = DateTime(1899, 12, 30);

    // Add the Julian date to the base date
    DateTime readableDate = baseDate.add(Duration(days: julianDate));

    // Format the DateTime to a readable format
    String formattedDate = DateFormat('yyyy-MM-dd').format(readableDate);

    return formattedDate;
  }
  String formatDate(dynamic date) {
    if (date is DateTime) {
      return _formatDate(date);
    } else if (date is String) {
      return date;
    } else {
      return 'Invalid date format';
    }
  }

  String teeTimeToReadableFormat(int teeTime) {
    // Calculate the hours and minutes from the tee time (in minutes)
    int hours = teeTime ~/ 60;  // Integer division for hours
    int minutes = teeTime % 60; // Remainder for minutes

    // Determine AM or PM
    String amPm = hours >= 12 ? 'PM' : 'AM';

    // Convert hours from 24-hour to 12-hour format
    hours = hours % 12;
    hours = hours == 0 ? 12 : hours; // If hours is 0, set it to 12 for AM/PM format

    // Format the time as a readable string (HH:mm AM/PM)
    String formattedTime = '$hours:${minutes.toString().padLeft(2, '0')} $amPm';

    return formattedTime;
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
      appBar: Header(title: 'SPLASH GOLF CLUB'),
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.courseName,
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
                                Icons.golf_course, 'Booking Type', widget.courseType == 1? "9 Hole": "18 Hole"),
                            _buildDetailRow(Icons.calendar_today, 'Tee Date',
                                '${julianDateToReadableFormat(widget.date)}'),
                            _buildDetailRow(Icons.access_time, 'Tee Time',
                                '${teeTimeToReadableFormat(widget.time)}'),
                            SizedBox(height: 12),
                            Divider(),
                            _buildDetailRow(
                                Icons.person, 'Golfers', '${widget.golfers}'),
                            _buildDetailRow(
                                Icons.group, 'Accompanying Persons', '${widget.guests}'),
                            _buildDetailRow(
                                Icons.shopping_cart, 'Caddies', '${widget.caddies}'),
                            _buildDetailRow(
                                Icons.local_taxi, 'Golf Carts', '${widget.carts}'),
                            _buildDetailRow(
                                Icons.fastfood, 'Food & Drinks', '${widget.food}'),
                            SizedBox(height: 12),
                            Divider(),
                            _buildDetailRow(Icons.attach_money, 'Payment Type',
                                '${widget.paymentType}',
                                isBold: true),
                            _buildDetailRow(Icons.attach_money, 'Paid Amount',
                                '${widget.paidAmount} THB',
                                isBold: true),
                            _buildDetailRow(Icons.attach_money, 'Total Price',
                                '${widget.totalPrice} THB',
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
