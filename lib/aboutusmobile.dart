import 'package:flutter/material.dart';

class AboutUsSectionmob extends StatefulWidget {
  @override
  _AboutUsSectionmobState createState() => _AboutUsSectionmobState();
}

class _AboutUsSectionmobState extends State<AboutUsSectionmob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
// Track hover state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.repeat(reverse: true); // Start animation
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
// Stop animation
            _controller.stop();
          });
        },
        onExit: (_) {
          setState(() {
// Resume animation
            _controller.repeat(reverse: true);
          });
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 111, 115, 120), Colors.cyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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
                  Opacity(
                    opacity: _animation.value,
                    child: const Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Text(
                        'About Us\n\nWe are passionate about creating beautiful and functional designs. Our mission is to deliver exceptional experiences through innovative solutions.About Us\n\nWe are passionate about creating beautiful and functional designs. Our mission is to deliver exceptional experiences through innovative solutions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Read More button styled as a down arrow
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Add your "Read More" action here
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Read More'),
                            content: const Text(
                              'Here is more information about us. We are dedicated to providing quality services and ensuring customer satisfaction. Our team is committed to excellence and innovative solutions tailored to meet your needs.',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
