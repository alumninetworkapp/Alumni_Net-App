import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:demo_alumnet/widgets/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_alumnet/components/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bioController = TextEditingController();

  // sign up user
  Future<void> signUp() async {
    // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // check password match
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);

      displayMessageToUser("Password do not match", context);
      return;
    }

    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(emailController.text,
          passwordController.text, nameController.text, bioController.text);

      // create user credentials
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  // create user document and collect them in cloud firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': nameController.text,
        'bio': "Enter your Bio",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  const Icon(
                    Icons.nature_people_rounded,
                    size: 120,
                  ),

                  //AlumNet
                  const Text(
                    'AlumNet',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    'Come connect with your alumni',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //name
                  MyTextField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      obscureText: false),

                  const SizedBox(
                    height: 20,
                  ),

                  //email
                  MyTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 20,
                  ),

                  //password
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      labelText: 'Password',
                      obscureText: true),

                  const SizedBox(
                    height: 20,
                  ),

                  //confirm password
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      obscureText: true),

                  const SizedBox(
                    height: 20,
                  ),

                  //sign up btn
                  MyCustomBtn(onTap: signUp, text: "Sign Up"),

                  const SizedBox(
                    height: 40,
                  ),

                  //Already a member? Sign In

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?'),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
