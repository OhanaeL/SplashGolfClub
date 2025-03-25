import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/bookingDetailsModel.dart';
import 'package:splashgolfclub/screens/courseBookingSuccess.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splashgolfclub/screens/loginPage.dart';
import 'package:uuid/uuid.dart';

class PaymentScreen extends StatefulWidget {
  final String courseName;
  final String courseId;
  final String imagePath;
  final String courseType;
  final String date;
  final String time;
  final int golfers;
  final int guests;
  final int caddies;
  final int carts;
  final int food;
  final double totalPrice;
  final dynamic julianDate;
  final dynamic julianTime;

  // Constructor to accept data from the previous screen
  PaymentScreen({
    required this.courseId,
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
    required this.julianDate,
    required this.julianTime,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool isFullPayment = true;

  String selectedPaymentMethod = "Credit Card";
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardholderNameController = TextEditingController();

  bool isLoading = false;


  Future<void> postData(String apiRoute, Map<String, dynamic> data) async {
    const String apiDatabase = "https://placeholderdatabase.onrender.com";

    try {
      final response = await http.post(
        Uri.parse('$apiDatabase/$apiRoute'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: ${response.body}");
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }


  void submitPayment() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    int? savedUserID = prefs.getInt('userID');

    if (savedUserID == null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Replace with the desired page
      );
    }

    var uuid = Uuid();

    var bookingData = {
      "courseId": widget.courseId,
      "courseImageUID":"",
      "courseLocation":"52 347 Phahonyothin Rd, Tambon Lak Hok, Amphoe Mueang Pathum Thani",
      "courseName":widget.courseName,
      "bookingType":widget.courseType == "9 Hole" ? 1 : 2,
      "clientID":savedUserID.toString(),
      "teeDate":widget.julianDate,
      "teeTime":widget.julianTime,
      "numberOfGolfers":widget.golfers,
      "numberOfnonPlayers":widget.guests,
      "Golf Cart":widget.carts,
      "Caddies":widget.caddies,
      "Food & Drinks":widget.food,
      "Golfer Names": List.generate(widget.guests, (index) => "Golfer ${index + 1}"),
      "status":"prepaid",
      "paymentType":isFullPayment? "fullPayment": "prepaid",
      "paid":isFullPayment ? widget.totalPrice : (widget.totalPrice * 0.3).toInt(),
      "price":widget.totalPrice,
      "id": uuid.v4()
    };

    postData("bookings", bookingData);

    // Perform the actual payment logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Processing!")),
    );

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationScreen(
          courseName: widget.courseName,
          courseType: widget.courseType,
          date: widget.date,
          time: widget.time,
          golfers: widget.golfers,
          guests: widget.golfers,
          caddies: widget.caddies,
          carts: widget.carts,
          food: widget.food,
          total: widget.totalPrice as int,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              "Select Payment Type",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isFullPayment ? Colors.grey[100] : Colors.green[800],
                                      foregroundColor: isFullPayment ? Colors.black : Colors.white,
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFullPayment = false;
                                      });
                                    },
                                    child: Text("Prepayment (30%)"),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isFullPayment ? Colors.green[800] : Colors.grey[100],
                                      foregroundColor: isFullPayment ? Colors.white : Colors.black,
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isFullPayment = true;
                                      });
                                    },
                                    child: Text("Full Payment"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Amount to Pay",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Container(
                              padding: EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${isFullPayment ? widget.totalPrice : (widget.totalPrice * 0.3).toInt()} THB",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "There will be no refund after payment is made.",
                                style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Credit Card Details",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: selectedPaymentMethod,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                ),
                              ),
                              items: ["Credit Card", "Debit Card"].map((method) {
                                return DropdownMenuItem(
                                  value: method,
                                  child: Text(method),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentMethod = value!;
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            buildTextField("Card Number", cardNumberController),
                            buildTextField("Expiry Date (MM/YY)", expiryDateController),
                            buildTextField("CVV", cvvController),
                            buildTextField("Cardholder Name", cardholderNameController),
                            SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800],
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                minimumSize: Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: isLoading ? null : submitPayment, // Disable while loading
                              child: isLoading
                                  ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                                  : Text("Submit Payment", style: TextStyle(fontSize: 16)),
                            ),
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
                              courseType: widget.courseType,
                              date: widget.date,
                              time: widget.time,
                              golfers: widget.golfers,
                              guests: widget.guests,
                              caddies: widget.caddies,
                              carts: widget.carts,
                              food: widget.food,
                              totalPrice: widget.totalPrice as int,
                            ),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_left, color: Colors.white),
                    )),
              ],
            )
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
