import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_alumnet/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 120, 30, 238),
//         title: Text(
//           'P R O F I L E', 
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

  final currentUser = FirebaseAuth.instance.currentUser!;

  // edit field
  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: const Color.fromARGB(255, 214, 143, 143),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          // get user data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(children: [
              SizedBox(height: 50),
              //profile pic
              Icon(
                Icons.person,
                size: 72,
              ),
              // Icon

              // user email

              Text(
                currentUser.email!,
                textAlign: TextAlign.center,
              ),

              // user details

              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0, top: 25.0),
              //   child: Text(
              //     'My Details',
              //     style: TextStyle(color: Colors.grey[600]),
              //   ),
              // ),

              // username

              MyTextbox(
                text: userData['username'],
                sectionName: "Username",
                onPressed: () => editField("username"),
              ),

              // bio

              MyTextbox(
                text: userData['username'],
                sectionName: "Bio",
                onPressed: () => editField("bio"),
              ),

              // user posts

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                child: Text(
                  'My Posts',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ]);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ), // StreamBuilder
    );
  }
}
