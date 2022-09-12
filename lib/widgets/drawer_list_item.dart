import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {

  final String text;
  final Icon icon;
  const DrawerListItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      dense: true,
      leading: icon,
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "Merriweather",
          fontSize: 15,
          letterSpacing: 2,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
