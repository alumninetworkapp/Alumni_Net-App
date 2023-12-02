import 'package:flutter/material.dart';
import 'package:temp1/screens/home_screen.dart';
import 'package:temp1/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:temp1/screens/widget_tree.dart';
import 'dart:ui';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
    );
  }
}
