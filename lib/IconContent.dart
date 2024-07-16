import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({super.key,
    required this.iconData, required this.iconDescription,
  });

  final IconData iconData;
  final String iconDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          size: 60.0,
          iconData,
        ),
        Text(iconDescription, style: const TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),),
      ],
    );
  }
}
