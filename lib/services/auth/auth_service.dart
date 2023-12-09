import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //user sign in method
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // trying sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }

    //catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //create a new user
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password, String name, String bio,) async {
    try {
      // trying sign up
      UserCredential? userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // after creating new user, create a new document for the user in the users
      //  collection
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'username': name,
        'bio' : bio,
      });

      return userCredential;
    }
    //catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create user document and collect them in cloud firestore
  // Future<void> createUserDocument(UserCredential? userCredential) async {
  //   if (userCredential != null && userCredential.user != null) {
  //     await FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(userCredential.user!.email)
  //         .set({
  //       'email': userCredential.user!.email,
  //       'username': nameController.text,
  //     });
  //   }
  // }

  //user sign out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
