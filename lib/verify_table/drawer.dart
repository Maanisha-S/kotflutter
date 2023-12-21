import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerList extends StatelessWidget {
  DrawerList({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
