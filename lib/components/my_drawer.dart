import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header
              const DrawerHeader(
                child: Icon(
                  Icons.nature_people_rounded,
                  size: 80,
                ),
              ),

              //home tile
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('H O M E'),
                  onTap: () {
                    // Navigate to Home
                    Navigator.pop(context);
                  },
                ),
              ),

              //profile tile
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('P R O F I L E'),
                  onTap: () {
                    //navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),

              //Members tile
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: Icon(Icons.people_alt_sharp),
                  title: Text('M E M B E R S'),
                  onTap: () {
                    // Navigate to members
                    Navigator.pushNamed(context, '/members_list');
                  },
                ),
              ),

              // About Us
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: Icon(Icons.diversity_3),
                  title: Text('A B O U T   U S'),
                  onTap: () {
                    // Navigate to about us
                    Navigator.pushNamed(context, '/aboutus_page');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: Icon(Icons.diversity_3),
                  title: Text('C O N T A C T   U S'),
                  onTap: () {
                    // Navigate to about us
                    Navigator.pushNamed(context, '/contacts_page');
                  },
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logout button
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 30),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('L O G O U T'),
                  onTap: signOut,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
