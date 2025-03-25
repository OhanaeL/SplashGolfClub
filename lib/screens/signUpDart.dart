import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashgolfclub/components/header.dart';
import 'package:splashgolfclub/screens/loginPage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<Map<String, String>> usersData = [];
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> saveUserData() async {

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
        "Email": emailController.text,
        "First Name": firstNameController.text,
        "Surname": surnameController.text,
        "Password": passwordController.text
      }
    };

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/new_user_request"),
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

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Replace with the desired page
      );

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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                          const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Firstname", style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Surname", style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: surnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Email", style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Password", style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Confirm Password", style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              TextFormField(
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  const Text("I agree with your terms and privacy policy."),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800], // Match the button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                saveUserData();
                              },
                              child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                          const SizedBox(height: 15),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: const Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.green, fontSize: 14),
                            ),
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
}
