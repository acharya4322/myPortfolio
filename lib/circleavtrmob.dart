import 'package:flutter/material.dart';

class Circleavtrmob extends StatelessWidget {
  const Circleavtrmob({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 120,
      backgroundImage: AssetImage('images/IMG_20240720_190631.png'),
    );
  }
}
