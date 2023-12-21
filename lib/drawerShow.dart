import 'package:flutter/material.dart';

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
          style: TextStyle(
              color: Colors.black54,
              fontSize: 23.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
