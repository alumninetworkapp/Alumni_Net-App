import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temp1/auth.dart';
import './signup_screen.dart';
import './signin_screen.dart';
import './home_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return SignIn();
        }
      },
    );
  }
}
