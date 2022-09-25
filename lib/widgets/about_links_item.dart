import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String url;
  final Color backgroundColor;
  final Color foregroundColor;

  const LinkItem({super.key, required this.name, required this.icon, required this.url, required this.backgroundColor, required this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, textDirection: TextDirection.ltr),
      label: Text(name),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        fixedSize: const MaterialStatePropertyAll(Size.fromWidth(220)),
      ),
      onPressed: () async {
        if(await canLaunchUrlString(url)){
          await launchUrlString(
            url,
            mode: LaunchMode.externalApplication
          );
        }
      },
    );
  }
}
