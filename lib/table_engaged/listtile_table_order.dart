import 'package:flutter/material.dart';

class ListTileTableOrder extends StatelessWidget {
  late String name;
  final void Function() ontap;

  ListTileTableOrder({required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Center(
          child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      )),
    );
  }
}
