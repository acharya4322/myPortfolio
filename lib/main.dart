import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_portifolio/aboutus.dart';
import 'package:my_portifolio/aboutusmobile.dart';
import 'package:my_portifolio/blinkbutton.dart';

import 'package:my_portifolio/circleavtrmob.dart';
import 'package:my_portifolio/contact.dart';
import 'package:my_portifolio/myworks.dart';
import 'package:my_portifolio/myworkstext.dart';
import 'package:my_portifolio/servises.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 69, 69, 69),
              Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    orientation == Orientation.portrait
                        ? Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Circleavtrmob(),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "           Hello, I'M Shashank",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          '       Flutter Developer',
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Freelancer Web / Mobile UI/UX Designer with Motion Graphics',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        BlinkingButtonsSection()
                                      ]),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Cool3DCircleAvatar(),
                              const SizedBox(width: 20),

                              //banner wala container
                              Cool3DBanner()
                            ],
                          ),
                    const SizedBox(height: 20),
                    orientation == Orientation.portrait
                        ? Column(
                            children: [
                              AboutUsSectionmob(),
                              const SizedBox(height: 25),
                              MyWorksPortrait(),
                              const SizedBox(height: 10),
                              ServicesSection()
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                BlinkingButtonsSection(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    //about us container
                                    AboutUsSection(),
                                    const SizedBox(width: 10),
                                    Expanded(child: ServicesSection()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyWorksText(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text('See all Works')),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const MyWorksLandscape()
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 1600,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 59, 59, 59),
                                Color.fromARGB(255, 83, 83, 83)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(child: ContactSection())),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Cool3DBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateX(-math.pi / 12), // Adjust the X rotation angle
            child: Container(
              decoration: BoxDecoration(
                // image: const DecorationImage(
                //   image: AssetImage('images/banner.png'),
                //   fit: BoxFit.cover,
                // ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(66, 0, 0, 0),
                    // blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: const Stack(children: [
                // Remove the Expanded widget wrapping the Image.asset
                // since it is now used as the background
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello, I'M Shashank",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Freelancer Web / Mobile UI/UX Designer with Motion Graphics',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class Cool3DCircleAvatar extends StatefulWidget {
  @override
  _Cool3DCircleAvatarState createState() => _Cool3DCircleAvatarState();
}

class _Cool3DCircleAvatarState extends State<Cool3DCircleAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hoverController.forward();
      },
      onExit: (_) {
        _hoverController.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust padding as needed
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(
                  -math.pi / 12), // Adjust the Y rotation angle for 3D effect
            child: Container(
              width: 240, // Adjust the width if needed
              height: 240, // Adjust the height if needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 45, 45, 45),
                    Color.fromARGB(255, 144, 144, 144)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 25,
                    offset: Offset(10, 20),
                  ),
                ],
                // border: Border.all(
                //   color: Colors.white.withOpacity(0.5), // Smooth border color
                //   // width: 2, // Border width
                // ),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      'images/IMG_20240720_190631-removebg-preview.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }
}
