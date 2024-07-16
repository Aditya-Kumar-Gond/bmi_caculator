import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionCard extends StatelessWidget{
  ActionCard({super.key, required this.toplabel,required this.number,required this.Circulerchildren});
  String toplabel;
  int number;
  List<Widget> Circulerchildren;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$toplabel',style: textStyle,),
        Text('$number',style: largeTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Circulerchildren,
        )
      ],
    );
  }

}

