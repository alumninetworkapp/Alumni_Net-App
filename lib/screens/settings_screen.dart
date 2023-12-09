import 'package:demo_alumnet/components/my_list_tile.dart';
import 'package:demo_alumnet/components/widgets.dart';
import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.playlist_add_check_circle_outlined),
                text: "My Achievments",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.message_outlined),
                text: "Messages",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.settings),
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
                icon: Icon(Icons.newspaper_outlined),
                text: "Blog",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.monitor_heart_outlined),
                text: "Activity",
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('VIDEOS'),
                ],
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.video_camera_back_outlined),
                text: "Promo Videos",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.emergency_recording_outlined),
                text: "Help",
                onTap: () {},
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
                icon: Icon(Icons.task_outlined),
                text: "Terms and Service",
                onTap: () {},
              ),
              MyCustomListTile(
                padding: 10,
                icon: Icon(Icons.policy_outlined),
                text: "Privacy Policy",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
