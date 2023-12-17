// import 'package:demo_alumnet/components/my_list_tile.dart';
// import 'package:demo_alumnet/services/auth/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   void signOut() {
//     //get auth service
//     final authService = Provider.of<AuthService>(context, listen: false);

//     authService.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'More',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.playlist_add_check_circle_outlined),
//                 text: "My Achievments",
//                 onTap: () {},
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.message_outlined),
//                 text: "Messages",
//                 onTap: () {},
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.settings),
//                 text: "Settings",
//                 onTap: () {},
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('COMMUNITY'),
//                 ],
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.newspaper_outlined),
//                 text: "Blog",
//                 onTap: () {},
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.monitor_heart_outlined),
//                 text: "Activity",
//                 onTap: () {},
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('VIDEOS'),
//                 ],
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.video_camera_back_outlined),
//                 text: "Promo Videos",
//                 onTap: () {},
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.emergency_recording_outlined),
//                 text: "Help",
//                 onTap: () {},
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('OTHERS'),
//                 ],
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.task_outlined),
//                 text: "Terms and Service",
//                 onTap: () {},
//               ),
//               MyCustomListTile(
//                 padding: 10,
//                 icon: const Icon(Icons.policy_outlined),
//                 text: "Privacy Policy",
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:demo_alumnet/components/my_list_tile.dart';
import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.playlist_add_check_circle_outlined),
                text: "My Achievements",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.message_outlined),
                text: "Messages",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.settings),
                text: "Settings",
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('COMMUNITY'),
                ],
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.school),
                text: "College",
                onTap: () {
                  launchUrl(Uri.parse('https://iiitdwd.ac.in/'));
                },
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.man_3),
                text: "Faculty",
                onTap: () {
                  launchUrl(Uri.parse('https://iiitdwd.ac.in/Faculty.php'));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('PORTALS'),
                ],
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.webhook),
                text: "AIMS",
                onTap: () {
                  launchUrl(Uri.parse('https://www.iiitdwd.ac.in/AIMS.php'));
                },
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.web_asset),
                text: "AIMS Live Instance",
                onTap: () {
                  launchUrl(Uri.parse('https://aims.iiitdwd.ac.in/aims/'));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('OTHERS'),
                ],
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.auto_graph),
                text: "Placements",
                onTap: () {
                  launchUrl(
                      Uri.parse('https://iiitdwd.ac.in/careerGuidance.php'));
                },
              ),
              MyCustomListTile(
                padding: 10,
                icon: const Icon(Icons.event),
                text: "Events",
                onTap: () {
                  launchUrl(Uri.parse('https://iiitdwd.ac.in/events.php'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
