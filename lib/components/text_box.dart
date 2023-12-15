import 'package:flutter/material.dart';

class MyTextbox extends StatelessWidget {
  final String text;
  final String sectionName;
  final Function()? onPressed;
  const MyTextbox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),

      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // section name
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey[500]),
              ),

              //editButton
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey[400],
                ),
              )
            ],
          ),
          // text
          Text(text),
        ],
      ), // Column
    ); // Container
  }
}
