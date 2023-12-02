import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temp1/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutBtn() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlumNet'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[_userUid(), _signOutBtn()]),
        ),
      ),
    );
  }
}
