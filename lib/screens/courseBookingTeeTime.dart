import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/components/tag.dart';
import 'package:splashgolfclub/screens/bookingDetailsModel.dart';
import 'package:splashgolfclub/screens/courseBookingDetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookingScreen extends StatefulWidget {
  final String courseName;
  final String imagePath;
  final String courseId;

  BookingScreen({
    required this.courseName,
    required this.imagePath,
    required this.courseId
  });

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<Map<String, dynamic>> allAvailabilityData =[
    {
      "Tee Minute": 374,
      "Crossover Minute": 476,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 382,
      "Crossover Minute": 484,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 390,
      "Crossover Minute": 492,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 398,
      "Crossover Minute": 500,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 406,
      "Crossover Minute": 508,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 414,
      "Crossover Minute": 516,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 422,
      "Crossover Minute": 524,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 430,
      "Crossover Minute": 532,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 438,
      "Crossover Minute": 540,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 446,
      "Crossover Minute": 548,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 454,
      "Crossover Minute": 556,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 462,
      "Crossover Minute": 564,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 470,
      "Crossover Minute": 572,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 478,
      "Crossover Minute": 580,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 486,
      "Crossover Minute": 588,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 494,
      "Crossover Minute": 596,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 502,
      "Crossover Minute": 604,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 510,
      "Crossover Minute": 612,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 518,
      "Crossover Minute": 620,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 526,
      "Crossover Minute": 628,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483647,
      "Availability Description": "AM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 686,
      "Crossover Minute": 788,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 694,
      "Crossover Minute": 796,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 702,
      "Crossover Minute": 804,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 710,
      "Crossover Minute": 812,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 718,
      "Crossover Minute": 820,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 726,
      "Crossover Minute": 828,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 734,
      "Crossover Minute": 836,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 742,
      "Crossover Minute": 844,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 750,
      "Crossover Minute": 852,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 758,
      "Crossover Minute": 860,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 766,
      "Crossover Minute": 868,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 774,
      "Crossover Minute": 876,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 782,
      "Crossover Minute": 884,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 790,
      "Crossover Minute": 892,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 798,
      "Crossover Minute": 900,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 806,
      "Crossover Minute": 908,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 814,
      "Crossover Minute": 916,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 822,
      "Crossover Minute": 924,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 830,
      "Crossover Minute": 932,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 838,
      "Crossover Minute": 940,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 846,
      "Crossover Minute": 948,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 854,
      "Crossover Minute": 956,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 862,
      "Crossover Minute": 964,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 870,
      "Crossover Minute": 972,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 878,
      "Crossover Minute": 980,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 886,
      "Crossover Minute": 988,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 894,
      "Crossover Minute": 996,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 902,
      "Crossover Minute": 1004,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 910,
      "Crossover Minute": 1012,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 918,
      "Crossover Minute": 1020,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 926,
      "Crossover Minute": 1028,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 934,
      "Crossover Minute": 1036,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 942,
      "Crossover Minute": 1044,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 950,
      "Crossover Minute": 1052,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 958,
      "Crossover Minute": 1060,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    },
    {
      "Tee Minute": 966,
      "Crossover Minute": 1068,
      "Available": [
        1,
        2
      ],
      "Crossover Available": [
        1,
        2
      ],
      "Available Online": true,
      "Availability ID": -2147483646,
      "Availability Description": "PM",
      "Availability Blocking": false,
      "Online Golfer Count": 4,
      "Is Shotgun Availability": false,
      "Golf Bookings": [],
      "Crossover Golf Bookings": []
    }
  ];

  List<Map<String, dynamic>> filteredAvailabilityData = [];
  List includedTeeTimes = [];
  List bookings = [];

  int? selectedIndex;

  TimeOfDay startTime = TimeOfDay(hour: 6, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 17, minute: 0);

  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  String selectedBookingType = "9 Hole";
  final List<String> bookingTypes = ["9 Hole", "18 Hole"];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _dateController.text = DateFormat('MM/dd/yyyy').format(DateTime.now());
    _initializeData();
  }

  List<int> getTeeTimesForDate(int searchDate) {
    List<int> teeTimes = [];
    for (var booking in bookings) {
      if (booking['teeDate'] == searchDate) {
        teeTimes.add(booking['teeTime']);
      }
    }
    return teeTimes;
  }

  Future<dynamic> fetchData(String apiRoute) async {
    const String apiDatabase = "https://placeholderdatabase.onrender.com";
    try {
      final response = await http.get(Uri.parse('$apiDatabase/$apiRoute'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> _initializeData() async {
    bookings = await fetchData("bookings");
    _filterTeeTimes();
  }

  String getSelectedTime(dynamic data, context){
    if (selectedIndex == null) {
      return "Select Tee Time";
    } else {
      int index = selectedIndex!;
      return convertToTime(filteredAvailabilityData[index]["Tee Minute"]);
    }
  }

  String formatDate(dynamic date) {
    if (date is DateTime) {
      return _formatDate(date);
    } else if (date is String) {
      return date;
    } else {
      return 'Select Booking Date';
    }
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

  String _formatDate(DateTime date) {
    return '${_getWeekday(date.weekday)}, ${_getMonth(date.month)} ${date.day}, ${date.year}';
  }

  String formatTime(dynamic time, BuildContext context) {
    if (time is TimeOfDay) {
      return time.format(context);
    } else if (time is String) {
      return time;
    } else {
      return 'Select Tee Time';
    }
  }

  String convertToTime(int minutes) {
    final DateTime now = DateTime(2025, 3, 22, 0, 0);
    final DateTime time = now.add(Duration(minutes: minutes));
    return DateFormat('h:mm a').format(time);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
        _filterTeeTimes();
      });
    }
  }

  void _filterTeeTimes() {
    int? julian = selectedDate!.difference(DateTime(1899, 12, 30)).inDays + 1;
    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;
    int bookingType = selectedBookingType == "9 Hole"? 1: 2;

    setState(() {
      filteredAvailabilityData = allAvailabilityData
          .where((item) =>
      item["Tee Minute"] >= startMinutes &&
          item["Tee Minute"] <= endMinutes &&
          item["Available"].contains(bookingType))
          .toList();

      includedTeeTimes = getTeeTimesForDate(julian);

      selectedIndex = null;
      filteredAvailabilityData = filteredAvailabilityData
          .where((item) =>
          !includedTeeTimes.contains(item["Tee Minute"]))
          .toList();
    });
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );


    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
        _filterTeeTimes();
      });
    }
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Booking",
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: selectedBookingType,
                                        decoration: InputDecoration(
                                          labelText: "Booking Type",
                                          labelStyle: TextStyle(
                                            color: Colors.black
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        items: bookingTypes.map((type) {
                                          return DropdownMenuItem<String>(
                                            value: type,
                                            child: Text(type),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedBookingType = newValue!;
                                          });
                                          _filterTeeTimes();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        controller: _dateController,
                                        readOnly: true,
                                        onTap: () => _selectDate(context),
                                        decoration: InputDecoration(
                                          labelText: 'Booking Date',
                                          suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 8),
                              ExpansionTile(
                                title: Text('Time Range Filters'),
                                collapsedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                collapsedBackgroundColor: Colors.grey[200],
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () => _selectTime(context, true),
                                                  child: InputDecorator(
                                                    decoration: InputDecoration(
                                                        labelText: "Start Time",
                                                        border: InputBorder.none),
                                                    child: Text(startTime.format(context)),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () => _selectTime(context, false),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                      labelText: "End Time",
                                                      border: InputBorder.none),
                                                  child: Text(endTime.format(context)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text("Showing available tee times for:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),

                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  TagWidget(text: '${(DateFormat("M/dd/yyyy").format(selectedDate ?? DateTime.now()))}'),

                                  TagWidget(text: '${startTime.format(context)} to ${endTime.format(context)}'),
                                  TagWidget(text: '${selectedBookingType}'),
                                ],
                              ),

                              SizedBox(height: 12),
                              Text("${filteredAvailabilityData.length} available booking times.",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SizedBox(
                                  height: 350,
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      childAspectRatio: 1.5,
                                    ),
                                    itemCount: filteredAvailabilityData.length,
                                    itemBuilder: (context, index) {
                                      final item = filteredAvailabilityData[index];
                                      bool isSelected = selectedIndex == index;
                                      return GestureDetector(
                                        onTap: includedTeeTimes.contains(item["Tee Minutes"])
                                          ? null
                                          : () {
                                        setState(() {
                                          if (selectedIndex == index) {
                                            selectedIndex = null;
                                          } else {
                                            selectedIndex = index;
                                          }
                                        });
                                      },
                                        child: Card(
                                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          color: includedTeeTimes.contains(item["Tee Minutes"])
                                            ? Colors.grey[300]  // Change color for disabled state
                                            : (isSelected ? Colors.green[200] : Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  convertToTime(item["Tee Minute"]),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green[800],
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.person, size: 18, color: Colors.black54),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      '${item["Online Golfer Count"]} Maximum',
                                                      style: TextStyle(color: Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                ),
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookingDetailsScreen(
                                            courseName: widget.courseName,
                                            imagePath: widget.imagePath,
                                            courseType: selectedBookingType,
                                            date: formatDate(selectedDate),
                                            time: getSelectedTime(selectedIndex, context),
                                            julianDate: selectedDate!.difference(DateTime(1899, 12, 30)).inDays + 1,
                                            julianTime: filteredAvailabilityData[selectedIndex ?? 0]["Tee Minute"],
                                            courseId: widget.courseId,
                                          ),
                                    ),
                                  );
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailsModel(
                                courseName: widget.courseName,
                                imagePath: widget.imagePath,
                                courseType: selectedBookingType,
                                date: formatDate(selectedDate),
                                time: getSelectedTime(selectedIndex, context),
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
                      )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
