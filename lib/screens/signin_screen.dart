import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'package:flutter/material.dart';
import './signup_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                height: 50,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 120,
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
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Add your authentication logic here
                  // For a simple example, just print the email and password
                  print('Email: $email');
                  print('Password: $password');
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 32.0),
              GestureDetector(
                onTap: () {
                  // Navigate to sign-up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'New User? ',
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Sign up here',
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





// import 'package:flutter/material.dart';
// import './signup_screen.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 0, 0, 0),
//               Color.fromARGB(255, 36, 2, 98),
//               Color.fromARGB(235, 59, 8, 96),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(8.0),
//           margin: EdgeInsets.symmetric(vertical: 110, horizontal: 25),
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 'Sign In',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 30,
//                 ),
//               ),
//               SizedBox(
//                 height: 120,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     hintText: 'Enter valid mail id as abc@gmail.com',
//                     hintStyle:
//                         TextStyle(color: Colors.white), // Set hint text color
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // Set border color when focused
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors
//                               .white), // Set border color when not focused
//                     ),
//                     labelStyle:
//                         TextStyle(color: Colors.white), // Set label text color
//                   ),
//                   style: TextStyle(color: Colors.white), // Set input text color
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   obscureText: true,
//                   controller: _passwordController,
//                   style: TextStyle(color: Colors.white), // Set input text color
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'Enter your secure password',
//                     hintStyle:
//                         TextStyle(color: Colors.white), // Set hint text color
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // Set border color when focused
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors
//                               .white), // Set border color when not focused
//                     ),
//                     labelStyle:
//                         TextStyle(color: Colors.white), // Set label text color
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform sign-in logic here
//                   String email = _emailController.text;
//                   String password = _passwordController.text;

//                   // Add your authentication logic here
//                   // For a simple example, just print the email and password
//                   print('Email: $email');
//                   print('Password: $password');
//                 },
//                 child: Text('Sign In'),
//               ),
//               SizedBox(height: 32.0),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to sign-up page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUp()),
//                   );
//                 },
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'New User? ',
//                     style: TextStyle(color: Colors.white),
//                     children: [
//                       TextSpan(
//                         text: 'Sign up here',
//                         style: TextStyle(
//                           color: Colors.white,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

