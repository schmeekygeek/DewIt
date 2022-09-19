import 'package:flutter/material.dart';

class DrawerListItem extends StatefulWidget {

  final String text;
  final Icon icon;
  final void Function() onTap;
  const DrawerListItem({super.key, required this.text, required this.icon, required this.onTap});

  @override
  State<DrawerListItem> createState() => _DrawerListItemState();
}

class _DrawerListItemState extends State<DrawerListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      dense: true,
      leading: widget.icon,
      title: Text(
        widget.text,
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
