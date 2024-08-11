import 'package:flutter/material.dart';

class ServicesSection extends StatefulWidget {
  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final List<String> _services = [
    'images/Web-Design-Logo.png',
    'images/ux-ui-design-services-500x500.jpg',
    'images/mobile dev.jpg',
    'images/consulting.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward(); // Start animation
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Services',
            style: TextStyle(
              fontFamily: 'fontfmly',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 203, 203, 203),
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _fadeAnimation,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                return ServiceCard(
                  imagePath: _services[index],
                  onTap: () {
                    switch (index) {
                      case 0:
                        // Action for first card
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Web Design clicked')),
                        );
                        break;
                      case 1:
                        // Action for second card
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('UX/UI Design clicked')),
                        );
                        break;
                      case 2:
                        // Action for third card
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Mobile Development clicked')),
                        );
                        break;
                      case 3:
                        // Action for fourth card
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Consulting clicked')),
                        );
                        break;
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ServiceCard extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ServiceCard({
    required this.imagePath,
    required this.onTap,
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: _isHovered ? Colors.blue : Colors.transparent),
              color: Colors.tealAccent,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
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
