import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward(); // Start animation
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ContactCard(
                  icon: Icons.phone,
                  title: 'Phone Number',
                  content: '+91 6201392582',
                  onTap: () => _launchURL('tel:+12345678901'),
                ),
                ContactCard(
                  icon: Icons.email,
                  title: 'Email Address',
                  content: 'acharya4322@gmail.com',
                  onTap: () => _launchURL('mailto:contact@example.com'),
                ),
                const SocialMediaCard(
                  icon: Icons.facebook,
                  platform: 'Facebook',
                  handle: 'facebook.com/yourprofile',
                  url: 'https://www.facebook.com/yourprofile',
                ),
                const SocialMediaCard(
                  icon: Icons.tag,
                  platform: 'LinkedIn',
                  handle: 'linkedin.com/in/shashank-acharya',
                  url:
                      'https://www.linkedin.com/in/shashank-acharya-4544512a9?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                ),
                const SocialMediaCard(
                  icon: Icons.tag,
                  platform: 'Instagram',
                  handle: '@sus_aank_',
                  url:
                      'https://www.instagram.com/sus_aank_?utm_source=qr&igsh=MjUycWp4dWhpdzFp',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    print('URL to be launched: $url');
    // Commented out the actual launch code for testing
    /*
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
    */
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback onTap;

  const ContactCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  final IconData icon;
  final String platform;
  final String handle;
  final String url;

  const SocialMediaCard({
    required this.icon,
    required this.platform,
    required this.handle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 10),
              Text(
                platform,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                handle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    print('URL to be launched: $url');
    // Commented out the actual launch code for testing
    /*
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
    */
  }
}
