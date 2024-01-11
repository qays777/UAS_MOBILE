import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';
import '../../regscreen/view/regscreen_view.dart';
import 'package:http/http.dart' as http;



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool privacyPolicyChecked = false;

  void _signInButtonPressed(BuildContext context) async {
    final String apiUrl = "https://planthouse-backend-qxjou66rkq-uc.a.run.app/login";

    final Map<String, dynamic> loginData = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginData),
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Check status field in response
        if (responseBody["status"] == "Success") {
          // Login successful
          print("Login successful");

          // Show success dialog
          _showSuccessDialog(context);

          // Navigate to OnboardingView after a delay
          Future.delayed(Duration(seconds: 2), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingView()),
            );
          });
        } else {
          // Login failed
          print("Login failed");

          // Show failure dialog
          _showFailureDialog(context);
        }
      } else {
        // Handle non-200 status code
        print("Non-200 status code: ${response.statusCode}");
        _showFailureDialog(context);
      }
    } catch (error) {
      // Handle other errors
      print("Error: $error");
      _showFailureDialog(context);
    }
  }

  void _createAccountButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegScreen()),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Successful'),
          content: const Text('Welcome back!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Navigate to the next screen or perform other actions
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Perform other actions if needed
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/img_bc.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 22),
              child: RichText(
                text: const TextSpan(
                  text: 'Login Account\n',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Welcome Back! Glad to see you again',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Username TextField
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 252, 251, 251),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.person_3_outlined,
                              color: Colors.black,
                            ),
                            fillColor: const Color.fromARGB(150, 252, 251, 251),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Password TextField
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(246, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                            fillColor: const Color.fromARGB(150, 252, 251, 251),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 0),

                    // Privacy Policy Checkbox
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          Checkbox(
                            value: privacyPolicyChecked,
                            onChanged: (value) {
                              print("Checkbox state changed: $value");
                              setState(() {
                                privacyPolicyChecked = value ?? false;
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'I agree with the privacy policy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 254, 254, 255),
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 70),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 9, 42, 88),
                            Color.fromARGB(255, 9, 42, 88)
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _signInButtonPressed(context);
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _createAccountButtonPressed(context);
                          },
                          child: const Text(
                            "Create New Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color.fromARGB(255, 253, 253, 253),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Colors.white, // Set underline color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
