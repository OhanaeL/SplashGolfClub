import 'package:flutter/material.dart';
import 'package:splashgolfclub/components/header.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashgolfclub/screens/bookingDetailsModelProfile.dart';
import 'package:splashgolfclub/screens/loginPage.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, String>> usersData = [];
  List bookings = [];
  List filteredBookings = [];

  final TextEditingController companyController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController givenNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedGender = "U";
  String? selectedTitle = "Mr";

  @override
  void initState() {
    super.initState();
    _initializeData();
  }


  Future<dynamic> fetchData(String apiRoute) async {
    const String apiDatabase = "https://placeholderdatabase.onrender.com";
    try {
      final response = await http.get(Uri.parse('$apiDatabase/$apiRoute'));

      if (response.statusCode == 200) {
        // Log the response data
        print(response.body);

        // Parse and return the response body
        return json.decode(response.body);
      } else {
        print('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> _initializeData() async {
    dynamic userData = await loadUsersData();
    bookings = await fetchData("bookings");
    final prefs = await SharedPreferences.getInstance();

    int? savedUserID = prefs.getInt('userID');

    print(savedUserID);

    if (savedUserID == null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    filteredBookings = bookings.where((booking) {
      return booking['clientID'] == savedUserID.toString();
    }).toList();
    setState(() {
      if (userData == null) {
        selectedTitle = "Mr";
        selectedGender = "M";
        firstNameController.text = "John";
        surnameController.text = "Doe";
        givenNameController.text = "Johnny";
        companyController.text = "XYZ Corp.";
        emailController.text = "john.doe@example.com";
        phoneController.text = "+1234567890";
      } else {
        selectedTitle = userData['Title'] ?? 'Mr';
        selectedGender = userData['Gender'] ?? 'M';
        firstNameController.text = userData['First Name'] ?? '';
        surnameController.text = userData['Surname'] ?? '';
        givenNameController.text = userData['Given Name'] ?? '';
        companyController.text = userData['Company'] ?? '';
        List filteredListEmail = userData['Communication List']?.where((item) => item["Communication Type"] == "M").toList();
        List filteredListPhone = userData['Communication List']?.where((item) => item["Communication Type"] == "C").toList();
        emailController.text = filteredListEmail[0]['Communication Detail'] ?? '';
        phoneController.text = filteredListPhone[0]['Communication Detail'] ?? '';
      }
    });
  }

  Future<void> saveUserData() async {

    final prefs = await SharedPreferences.getInstance();

    int savedUserID = prefs.getInt('userID') ?? 0;
    setState(() {
    });

    final String baseUrl = "https://ixschool.cimso.xyz";

    final Map<String, String> headers = {
      "Authorization": jsonEncode({
        "Client Login ID": "CiMSO.dev",
        "Client Password": "CiMSO.dev",
        "hg_pass": "nGXUF1i^57I^ao^o",
      }),
      "Content-Type": "application/json",
    };

    final Map<String, dynamic> body = {
      "hg_code": "ixschool",
      "payload": {
        "Client ID": savedUserID,
        "Title": selectedTitle,
        "Gender": selectedGender,
        "First Name": firstNameController.text,
        "Surname": surnameController.text,
        "Given Name": givenNameController.text,
        "Company": companyController.text,
      }
    };

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/set_client_request"),
        headers: headers,
        body: jsonEncode(body),
      );

      final responseData = jsonDecode(response.body);
      final int? errorCode = responseData['error_code']; // Extracting error code

      if (errorCode != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something unexpected happened!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        return ;
      }

    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("There was an error!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<dynamic> loadUsersData() async {

    final prefs = await SharedPreferences.getInstance();

    int? savedUserID = prefs.getInt('userID') ?? null;

    print(savedUserID);

    if (savedUserID == null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    final String baseUrl = "https://ixschool.cimso.xyz";

    final Map<String, String> headers = {
      "Authorization": jsonEncode({
        "Client Login ID": "CiMSO.dev",
        "Client Password": "CiMSO.dev",
        "hg_pass": "nGXUF1i^57I^ao^o",
      }),
      "Content-Type": "application/json",
    };

    final Map<String, dynamic> body = {
      "hg_code": "ixschool",
      "payload": {
        "Client ID" : savedUserID
      }
    };

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/get_client_request"),
        headers: headers,
        body: jsonEncode(body),
      );

      final responseData = jsonDecode(response.body);
      final int? errorCode = responseData['error_code']; // Extracting error code

      if (errorCode != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something unexpected happened!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        return ;
      }

      Map<String, dynamic> payload = responseData['payload'];
      return payload;

    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("There was an error!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    surnameController.dispose();
    givenNameController.dispose();
    companyController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(title: 'SPLASH GOLF CLUB'),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
                child: SizedBox(
                  width: 390,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildProfileCard(),
                        SizedBox(height: 16),
                        _buildProfileData(),
                        SizedBox(height: 16),
                        _buildBookingsCard(),
                        SizedBox(height: 16),
                        _buildMembershipCard(),
                        SizedBox(height: 16),
                        _buildAccountInfoCard(),
                        SizedBox(height: 16),
                        _buildLogoutButton(),
                      ],
                    ),
                  ),
                )
            )
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 400),CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: AssetImage('assets/golfer_profile.png'),
            ),
            SizedBox(width: 20),
            Text("Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            IconButton(icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Changing profile picture is currently unavailable on mobile!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              })
          ],
        ),
      ),
    );
  }

  Widget _buildProfileData() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(icon: Icon(Icons.save),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Saving!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      await saveUserData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Changes saved successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      setState(() {
                      });

                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),DropdownButtonFormField<String>(
              value: selectedTitle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                label: Text("Title"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: ["Mr", "Mrs", "Ms", "Prof", "Dr", ""].map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTitle = value;
                });
              },
            ),
            SizedBox(height: 10),DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
                filled: true,
                label: Text("Gender"),
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: ["M", "F", "U"].map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            SizedBox(height: 10),
            _buildInputField("Firstname", firstNameController),
            SizedBox(height: 10),
            _buildInputField("Surname", surnameController),
            SizedBox(height: 10),
            _buildInputField("Given Name", givenNameController),
            SizedBox(height: 10),
            _buildInputField("Company", companyController),
            SizedBox(height: 10),
            _buildInputField("Email", emailController, isEnabled: false),
            SizedBox(height: 10),
            _buildInputField("Phone Number", phoneController, isEnabled: false),
            SizedBox(height: 10),
            Text("Please edit the email and phone number on the website.")
          ],
        ),
      ),
    );
  }

  Widget _buildBookingsCard() {
    return Container(
      color: Colors.white,
      width: 400,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bookings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              SizedBox(
                width: 400,
                height: 50 * filteredBookings.length.toDouble(),
                child: ListView.builder(
                  itemCount: filteredBookings.length,
                  itemBuilder: (context, index) {
                    Map booking = filteredBookings[index];
                    String courseName = booking['courseName'];

                    return ListTile(
                      title: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailsModelProfile(
                                courseName: booking["courseName"],
                                courseType: booking["bookingType"],
                                date: booking["teeDate"],
                                time: booking["teeTime"],
                                golfers: booking["numberOfGolfers"],
                                guests: booking["numberOfnonPlayers"],
                                caddies: booking["Caddies"],
                                carts: booking["Golf Cart"],
                                food: booking["Food & Drinks"],
                                totalPrice: booking["price"],
                                status: booking["status"],
                                paymentType: booking["paymentType"],
                                paidAmount: booking["paid"],
                              ),
                            ),
                          );
                        },
                        child: Text('Booking at $courseName'),
                      ),
                    );
                  },
                ),
              ),
              Text('No Booking Available'),
              SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                  ),
                  onPressed: () {},
                  child: Text('Go to Golf Courses',
                    style: TextStyle(
                        color: Colors.white
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInputField(String label, TextEditingController controller, {bool isEnabled = true}) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        enabled: isEnabled, // Controls whether the field is editable
        decoration: InputDecoration(
          filled: true,
          fillColor: isEnabled ? Colors.grey[100] : Colors.grey[300], // Different color when disabled
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }


  Widget _buildMembershipCard() {
    return Container(
      width: 400,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Membership Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('No Membership Available')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return Container(
      width: 400,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Member Since: March 2025'),
              Text('Last Login: Today'),
              Text('Status: Active', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () async {

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove("userID");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text('Logout', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

}
