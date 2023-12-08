import 'package:flutter/material.dart';

class MyCustomListTile extends StatelessWidget {
  final double padding;
  final Icon icon;
  final String text;
  final void Function()? onTap;

  const MyCustomListTile({super.key, 
  required this.padding,
  required this.icon,
  required this.text,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

