import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget{
  ReusableCard({required this.cardColor, required this.cardChild});
  final Color cardColor;
  Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(child: cardChild),
    );
  }

}
