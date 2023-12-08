import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connecting Alumni, Building Networks',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Welcome to AlumNet, your one-stop platform to reconnect with fellow alumni, discover new opportunities, and build meaningful relationships.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildMissionCard(), // Add the mission card
              const SizedBox(height: 16.0),
              _buildValuesCard(), // Add the values card
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: const Text(
                  'Join us today and experience the power of AlumNet!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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

Widget _buildMissionCard() {
  return Card(
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(vertical: 16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Our Mission',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'To empower our alumni community by providing a platform for : \n \nNetworking and reconnecting with fellow graduates \nSharing career advice and mentorship opportunities \nCollaborating on projects and initiatives \nStaying up-to-date on alumni news and events',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildValuesCard() {
  return Card(
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(vertical: 16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Our Values',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
                _buildBoldTextSpan('Community:'),
                const TextSpan(
                  text:
                      ' We believe in fostering a strong and supportive community where alumni can feel connected and belong. \n',
                ),
                _buildBoldTextSpan('Collaboration:'),
                const TextSpan(
                  text:
                      ' We encourage our members to work together to achieve shared goals and make a positive impact. \n',
                ),
                _buildBoldTextSpan('Innovation:'),
                const TextSpan(
                  text:
                      ' We are committed to developing new and innovative features and tools to enhance the user experience. \n',
                ),
                _buildBoldTextSpan('Inclusivity:'),
                const TextSpan(
                  text:
                      ' We strive to create a welcoming and inclusive environment where everyone feels respected and valued.',
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

TextSpan _buildBoldTextSpan(String text) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}
