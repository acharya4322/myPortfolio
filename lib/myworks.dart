import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MyWorksPortrait extends StatefulWidget {
  @override
  _MyWorksPortraitState createState() => _MyWorksPortraitState();
}

class _MyWorksPortraitState extends State<MyWorksPortrait> {
  final PageController _controller = PageController(
    initialPage: 1, // Start at the first project
    viewportFraction:
        0.75, // Adjust viewport fraction to show parts of adjacent cards
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // If at the beginning, jump to the end
      if (_controller.page!.toInt() == 0) {
        _controller.jumpToPage(5);
      }
      // If at the end, jump to the beginning
      else if (_controller.page!.toInt() == 6) {
        _controller.jumpToPage(1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 116, 116, 116),
            Color.fromARGB(255, 85, 85, 85)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'My Works',
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'fontfmly'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                if (index == 0 || index == 6) {
                  // Return an empty container for the dummy pages
                  return Container();
                }
                return MyWorkCard(
                  imageUrl: 'https://via.placeholder.com/150',
                  title: 'Project $index',
                );
              },
              itemCount: 7, // 5 items + 2 dummy items for cyclic effect
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                if (index == 0) {
                  _controller.jumpToPage(5);
                } else if (index == 6) {
                  _controller.jumpToPage(1);
                }
              },
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class MyWorkCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const MyWorkCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWorksLandscape extends StatefulWidget {
  const MyWorksLandscape({Key? key}) : super(key: key);

  @override
  _MyWorksLandscapeState createState() => _MyWorksLandscapeState();
}

class _MyWorksLandscapeState extends State<MyWorksLandscape> {
  final int numContainers = 10;
  final List<double> containerSizes = [
    400.0,
    350.0,
    300.0,
    250.0,
    200.0,
    150.0,
    200.0,
    175.0,
    200.0,
    250.0,
  ];
  final double mainContainerWidth = 1600.0;
  final double mainContainerHeight = 800.0;
  final List<Offset> positions = [];
  final List<Offset> velocities = [];
  final List<Offset?> savedVelocities = List<Offset?>.filled(10, null);
  final Random random = Random();

  // List of image paths
  final List<String> imageAssets = [
    'images/first.jpg',
    'images/myworks/IMG-20240723-WA0047.jpg',
    'images/myworks/IMG-20240723-WA0048.jpg',
    'images/myworks/IMG-20240723-WA0049.jpg',
    'images/myworks/IMG-20240723-WA0050.jpg',
    'images/myworks/IMG-20240723-WA0051.jpg',
    'images/myworks/IMG-20240723-WA0052.jpg',
    'images/first.jpg',
    'images/myworks/IMG-20240723-WA0047.jpg',
    'images/myworks/IMG-20240723-WA0051.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _initializePositions();
    _startMovement();
  }

  void _initializePositions() {
    for (int i = 0; i < containerSizes.length; i++) {
      Offset position;
      bool overlapping;

      do {
        position = _getRandomPosition(containerSizes[i]);
        overlapping = false;

        for (int j = 0; j < positions.length; j++) {
          if ((positions[j] - position).distance <
              (containerSizes[i] + containerSizes[j]) / 2) {
            overlapping = true;
            break;
          }
        }
      } while (overlapping);

      positions.add(position);
      velocities.add(_getRandomVelocity());
    }
  }

  Offset _getRandomPosition(double size) {
    return Offset(
      random.nextDouble() * (mainContainerWidth - size),
      random.nextDouble() * (mainContainerHeight - size),
    );
  }

  Offset _getRandomVelocity() {
    return Offset(
      (random.nextDouble() - 0.5) * 4,
      (random.nextDouble() - 0.5) * 4,
    );
  }

  void _startMovement() {
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _updatePositions();
      });
    });
  }

  void _updatePositions() {
    for (int i = 0; i < containerSizes.length; i++) {
      if (savedVelocities[i] != null) continue;

      double size = containerSizes[i];
      Offset newPos = positions[i] + velocities[i];

      // Check for boundary collision
      if (newPos.dx <= 0 || newPos.dx >= mainContainerWidth - size) {
        velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
      }
      if (newPos.dy <= 0 || newPos.dy >= mainContainerHeight - size) {
        velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
      }

      // Check for collision with other containers
      for (int j = 0; j < containerSizes.length; j++) {
        if (i != j &&
            (positions[j] - newPos).distance < (size + containerSizes[j]) / 2) {
          velocities[i] = Offset(-velocities[i].dx, -velocities[i].dy);
          velocities[j] = Offset(-velocities[j].dx, -velocities[j].dy);
          break;
        }
      }

      positions[i] = positions[i] + velocities[i];
    }
  }

  void _onEnter(int index) {
    setState(() {
      savedVelocities[index] = velocities[index];
      velocities[index] = Offset.zero;
    });
  }

  void _onExit(int index) {
    setState(() {
      velocities[index] = savedVelocities[index]!;
      savedVelocities[index] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mainContainerHeight,
      width: mainContainerWidth,
      child: Stack(
        children: List.generate(containerSizes.length, (index) {
          return Positioned(
            left: positions[index].dx,
            top: positions[index].dy,
            child: MouseRegion(
              onEnter: (_) => _onEnter(index),
              onExit: (_) => _onExit(index),
              child: Image.asset(
                imageAssets[index % imageAssets.length],
                height: containerSizes[index],
                width: containerSizes[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
