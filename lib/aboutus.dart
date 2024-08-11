import 'package:flutter/material.dart';

class AboutUsSection extends StatefulWidget {
  @override
  _AboutUsSectionState createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  bool _isTitleHovered = false;
  bool _isTextHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 700,
        height: 500,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 73, 73, 73)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(120), bottomRight: Radius.circular(120)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isTitleHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isTitleHovered = false;
                });
              },
              child: TweenAnimationBuilder(
                tween: ColorTween(
                  begin: const Color.fromARGB(255, 146, 146, 146),
                  end: _isTitleHovered
                      ? Color.fromARGB(255, 156, 63, 255) // RGB color on hover
                      : Color.fromARGB(255, 146, 146, 146),
                ),
                duration: const Duration(milliseconds: 300),
                builder: (context, Color? color, child) {
                  return TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 1.0,
                      end: _isTitleHovered ? 1.1 : 1.0,
                    ),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, double scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    },
                    child: Text(
                      'About Me',
                      style: TextStyle(
                        color: color,
                        fontFamily: 'fontfmly',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isTextHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isTextHovered = false;
                });
              },
              child: TweenAnimationBuilder(
                tween: ColorTween(
                  begin: const Color.fromARGB(255, 164, 164, 164),
                  end: _isTextHovered
                      ? Colors.tealAccent // RGB color on hover
                      : Color.fromARGB(255, 164, 164, 164),
                ),
                duration: const Duration(milliseconds: 300),
                builder: (context, Color? color, child) {
                  return TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 1.0,
                      end: _isTextHovered ? 1.05 : 1.0,
                    ),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, double scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        'I\'m Shashank Acharya, a dedicated developer with expertise in Flutter and IoT. I hold a Bachelor\'s degree in IT from NIET, Greater Noida, and have experience working on impactful projects at KT Developer. My skills span mobile app development and IoT solutions, and I am certified in JavaScript and Design Thinking. I am also proud of my patented projects involving AI/ML and TV monitoring systems. Passionate about tech innovation, I stay connected with the latest advancements and am open to new collaborations.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: color,
                          fontFamily: 'fontfmly',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Read More button styled as a down arrow
          ],
        ),
      ),
    );
  }
}
