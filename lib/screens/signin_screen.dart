import 'package:demo_alumnet/components/widgets.dart';
import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  Future<void> signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Icon(
                    Icons.nature_people_rounded,
                    size: 120,
                  ),

                  //AlumNet
                  Text(
                    'AlumNet',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Welcome back, you been missed!!',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(
                    height: 50,
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

                  //signinbtn
                  MyCustomBtn(onTap: signIn, text: "Sign In"),

                  const SizedBox(
                    height: 40,
                  ),

                  //Already a member? Sign In

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?'),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register Now',
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
