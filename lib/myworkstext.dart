import 'dart:math';
import 'package:flutter/material.dart';

class MyWorksText extends StatefulWidget {
  @override
  _MyWorksTextState createState() => _MyWorksTextState();
}

class _MyWorksTextState extends State<MyWorksText>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;
  final String _text = 'My Works';
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _colors = _generateColors(_text.length);
    _controllers = List.generate(_text.length, (index) {
      return AnimationController(
        duration: const Duration(
            seconds: 2), // Increased duration for a smoother effect
        vsync: this,
      )..repeat(reverse: true);
    });

    final random = Random();
    _animations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: Offset.zero,
        end: Offset(
          random.nextDouble() * 50 -
              25, // Increased range for more pronounced movement
          random.nextDouble() * 50 - 25,
        ),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.elasticInOut, // More pronounced curve
      ));
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  List<Color> _generateColors(int length) {
    final List<Color> colors = [];
    final List<Color> possibleColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.pink,
      Colors.yellow,
      Colors.teal,
      Colors.indigo,
    ];

    final random = Random();
    for (int i = 0; i < length; i++) {
      colors.add(possibleColors[random.nextInt(possibleColors.length)]);
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_text.length, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: _animations[index].value,
              child: Text(
                _text[index],
                style: TextStyle(
                  color: _colors[index],
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      'fontfmly', // Ensure this matches your font family name
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
