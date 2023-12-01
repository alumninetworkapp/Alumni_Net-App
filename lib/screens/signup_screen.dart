import 'package:flutter/material.dart';
import './signin_screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _collegeIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 36, 2, 98),
              Color.fromARGB(235, 59, 8, 96),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 110, horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _collegeIdController,
                  decoration: InputDecoration(
                    labelText: 'College ID',
                    hintText: 'Enter your valid college id',
                    hintStyle:
                        TextStyle(color: Colors.white), // Set hint text color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Set border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Set border color when not focused
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white), // Set label text color
                  ),
                  style: TextStyle(color: Colors.white), // Set input text color
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your full name',
                    hintStyle:
                        TextStyle(color: Colors.white), // Set hint text color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Set border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Set border color when not focused
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white), // Set label text color
                  ),
                  style: TextStyle(color: Colors.white), // Set input text color
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter valid mail id',
                    hintStyle:
                        TextStyle(color: Colors.white), // Set hint text color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Set border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Set border color when not focused
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white), // Set label text color
                  ),
                  style: TextStyle(color: Colors.white), // Set input text color
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white), // Set input text color
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your secure password',
                    hintStyle:
                        TextStyle(color: Colors.white), // Set hint text color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Set border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Set border color when not focused
                    ),
                    labelStyle:
                        TextStyle(color: Colors.white), // Set label text color
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-in logic here
                  String college = _collegeIdController.text;
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  // Add your authentication logic here
                  // For a simple example, just print the email and password
                  print('CollegeId: $college');
                  print('Name: $name');
                  print('Email: $email');
                  print('Password: $password');
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 32.0),
              GestureDetector(
                onTap: () {
                  // Navigate to sign-up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already a member? ',
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
