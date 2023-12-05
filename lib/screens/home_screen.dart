import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_alumnet/components/my_drawer.dart';
import 'package:demo_alumnet/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = "AlumNet";

  //instance of the auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list of users except the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  //build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except the current user
    if (_auth.currentUser!.email != data['username']) {
      return ListTile(
        title: Text(data['username']), // Use const for static text
        onTap: () {
          // go to the chat screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['username'],
                receiverUserid: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      // return an empty container
      return Container();
    }
  }
}





// import 'dart:js';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/screens/chat_screen.dart';
// import 'package:demo_alumnet/services/auth/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   //instance of the auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //signOut method
//   void signOut() {
//     //get auth service
//     final authService = Provider.of<AuthService>(context, listen: false);

//     authService.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               fontStyle: FontStyle.italic),
//         ),
//         actions: [
//           IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: _buildUserList(),
//     );
//   }

//   //build a list of users except current logged in user
//   Widget _buildUserList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Error');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('Loading...');
//         }

//         return ListView(
//           children: snapshot.data!.docs
//               .map<Widget>((doc) => _buildUserListItem(doc))
//               .toList(),
//         );
//       },
//     );
//   }

//   //build individual user list items
//   Widget _buildUserListItem(DocumentSnapshot document, BuildContext context) {
//     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

//     // display all users except the current user
//     if (_auth.currentUser!.email != data['email']) {
//       return ListTile(
//         title: Text(data['email']), // Wrap data['email'] with Text widget
//         onTap: () {
//           // go to chat screen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ChatPage(
//                 receiverUserEmail: data['email'],
//                 receiverUserid: data['uid'],
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       // return empty container
//       return Container();
//     }
//   }

// }




  // Widget _buildUserListItem(DocumentSnapshot document) {
  //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  //   // display all user except current user
  //   if (_auth.currentUser!.email != data['email']) {
  //     return ListTile(
  //       title: data['email'],
  //       onTap: () {
  //         // go to chat screen
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => ChatPage(
  //                 receiverUserEmail: data['email'],
  //                 receiverUserid: data['uid'],
  //               ),
  //             ));
  //       },
  //     );
  //   } else {
  //     //return empty container
  //     return Container();
  //   }
  // }