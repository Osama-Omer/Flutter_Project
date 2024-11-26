import 'package:app/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isvisiblep = false;

  // Create a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 245, 243, 243)),
      backgroundColor: const Color.fromARGB(255, 245, 243, 243),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Attach the form key to the Form widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: 140,
                    ),
                    const Text(
                      "SIGN IN",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "welcome back again",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Email input field with validator
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 252, 252, 252)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 168, 167, 164)),
                          prefixIcon: Icon(Icons.email_sharp),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  width: 2.5,
                                  color:
                                      Color.fromARGB(255, 216, 73, 73))),
                        ),
                        // Validator for email field
                        validator: (value) {
                         UserName=value!;

                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Password input field with validator
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: const Color.fromARGB(255, 252, 252, 252)),
                      child: TextFormField(
                        obscureText: _isvisiblep,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 168, 167, 164)),
                          prefixIcon: const Icon(Icons.pages_sharp),
                          suffixIcon: IconButton(
                            icon: Icon(_isvisiblep
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isvisiblep = !_isvisiblep;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  width: 2.5,
                                  color: Color.fromARGB(255, 216, 73, 73))),
                        ),
                        // Validator for password field
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Sign In button
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(34))),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // If the form is valid, navigate to Profile page
                            Navigator.of(context).pushNamed("Profile");
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 241, 228, 228)),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 7)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("you don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Sign_up");
                          },
                          child: const Text(
                            "sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 219, 87, 11)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
