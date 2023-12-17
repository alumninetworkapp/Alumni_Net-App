import 'package:flutter/material.dart';

// My Custom Text Field

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(230, 0, 0, 0)),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(230, 108, 14, 159)),
        ),
        fillColor: Colors.deepPurple[100],
        filled: true,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

// My Custom Button

class MyCustomBtn extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyCustomBtn({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.deepPurple[600], 
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
