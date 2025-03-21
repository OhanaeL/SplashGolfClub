import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/bookingDetailsModel.dart';
import 'package:splashgolfclub/screens/courseBookingPayment.dart';


class BookingDetailsScreen extends StatefulWidget {

  final String courseName;
  final String imagePath;
  final String courseType;
  final String date;
  final String time;

  // Constructor to accept data from the previous screen
  BookingDetailsScreen({
    required this.courseName,
    required this.imagePath,
    required this.courseType,
    required this.date,
    required this.time,
  });

  @override
  _BookingDetailsScreenState createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  // Sample data
  List<Map<String, dynamic>> items = [
    {"title": "Golfers", "price": 600, "count": 1, "icon": Icons.sports_golf},
    {"title": "Persons", "price": 100, "count": 0, "icon": Icons.person},
    {"title": "Caddies", "price": 300, "count": 0, "icon": Icons.lock},
    {"title": "Golf Cart", "price": 500, "count": 1, "icon": Icons.directions_car},
    {"title": "Food & Drinks", "price": 300, "count": 0, "icon": Icons.fastfood},
  ];

  int totalPrice = 1100;

  void updateCount(int index, int change) {
    setState(() {
      items[index]["count"] += change;
      if (items[index]["count"] < 0) items[index]["count"] = 0;
      totalPrice = items.fold(0, (sum, item) => totalPrice = items.fold<int>(0, (sum, item) => sum + (item["count"] as int) * (item["price"] as int)));
    });
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
                              "Booking Details",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return BookingItem(
                                    title: items[index]["title"],
                                    price: items[index]["price"],
                                    count: items[index]["count"],
                                    icon: items[index]["icon"],
                                    onAdd: () => updateCount(index, 1),
                                    onRemove: () => updateCount(index, -1),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Total: $totalPrice THB",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                        PaymentScreen(
                                          courseName: widget.courseName,
                                          imagePath: widget.imagePath,
                                          courseType: widget.courseType,
                                          date: widget.date,
                                          time: widget.time,
                                          golfers: items[0]["count"],
                                          guests: items[1]["count"],
                                          caddies: items[2]["count"],
                                          carts: items[3]["count"],
                                          food: items[4]["count"],
                                          totalPrice: totalPrice as double,
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
                              courseType: widget.courseType,
                              date: widget.date,
                              time: widget.time,
                              golfers: items[0]["count"],
                              guests: items[1]["count"],
                              caddies: items[2]["count"],
                              carts: items[3]["count"],
                              food: items[4]["count"],
                              totalPrice: totalPrice,
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
}

class BookingItem extends StatelessWidget {
  final String title;
  final int price;
  final int count;
  final IconData icon;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  BookingItem({
    required this.title,
    required this.price,
    required this.count,
    required this.icon,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              SizedBox(width: 10),
              Text(
                "$title - $price THB",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: onRemove,
              ),
              Text("$count", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
