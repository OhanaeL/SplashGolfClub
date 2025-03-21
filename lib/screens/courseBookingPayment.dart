import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/bookingDetailsModel.dart';
import 'package:splashgolfclub/screens/courseBookingSuccess.dart';

class PaymentScreen extends StatefulWidget {
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
  final double totalPrice;

  // Constructor to accept data from the previous screen
  PaymentScreen({
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
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool isFullPayment = true;
  final int totalAmount = 1100;

  String selectedPaymentMethod = "Credit Card";
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardholderNameController = TextEditingController();

  bool isLoading = false;

  void submitPayment() async {
    setState(() {
      isLoading = true;
    });

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), // Height of your custom header
          child: Header(title: 'SPLASH GOLF CLUB')),
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
                                "${isFullPayment ? totalAmount : (totalAmount * 0.3).toInt()} THB",
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
