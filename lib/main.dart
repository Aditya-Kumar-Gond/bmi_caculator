import 'package:flutter/material.dart';
import 'InputPage.dart';

void main() {
  runApp(BMIcaculator());
}

class BMIcaculator extends StatelessWidget {
  const BMIcaculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        canvasColor: const Color(0xFF0A0D22),
        primaryColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0D22)
        )
      ),
      home:  const InputPage(),
    );
  }
}

