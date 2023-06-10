import 'package:flutter/material.dart';
import 'package:imc_calculator/views/home_view.dart';

void main() {
  runApp(const IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  const IMCCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
