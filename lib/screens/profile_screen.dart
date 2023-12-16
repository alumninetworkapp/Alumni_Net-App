// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/text_box.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final currentUser = FirebaseAuth.instance.currentUser!;

//   final userCollection = FirebaseFirestore.instance.collection("users");

//   // edit field
//   // Future<void> editField(String field) async {
//   //   String newValue = "";

//   //   await showDialog(
//   //     context: context,
//   //     builder: (context) => AlertDialog(
//   //       title: Text("Edit " + $field),
//   //     ),
//   //   );
//   // }

//   Future<void> editField(String field) async {
//     String newValue = "";
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.grey[900],
//         title: Text(
//           "Edit $field",
//           style: const TextStyle(color: Colors.white),
//         ), // Text
//         content: TextField(
//           autofocus: true,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: "Enter new $field",
//             hintStyle: TextStyle(color: Colors.grey),
//           ),
//           onChanged: (value) {
//             newValue = value;
//           },
//         ),

//         actions: [
//           // cancel button
//           TextButton(
//             child: Text(
//               'Cancel',
//               style: TextStyle(color: Colors.white),
//             ),
//             // Text
//             onPressed: () => Navigator.pop(context),
//           ), // TextButton
//           // save button
//           TextButton(
//             child: Text(
//               'Save',
//               style: TextStyle(color: Colors.white),
//             ), // Text
//             onPressed: () => Navigator.of(context).pop(newValue),
//           ), // TextButton
//         ],
//       ),
//     );

//     if (newValue.isNotEmpty) {
//       await userCollection.doc(currentUser.uid).update({field: newValue});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text("Profile Page"),
//         backgroundColor: const Color.fromARGB(255, 190, 147, 228),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("users")
//             .doc(currentUser.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           // get user data
//           if (snapshot.hasData) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;

//             return ListView(children: [
//               SizedBox(height: 50),
//               //profile pic
//               Icon(
//                 Icons.person,
//                 size: 72,
//               ),
//               // Icon

//               // user email

//               Text(
//                 currentUser.email!,
//                 textAlign: TextAlign.center,
//               ),

//               // user details

//               // Padding(
//               //   padding: const EdgeInsets.only(left: 25.0, top: 25.0),
//               //   child: Text(
//               //     'My Details',
//               //     style: TextStyle(color: Colors.grey[600]),
//               //   ),
//               // ),

//               // username

//               MyTextbox(
//                 text: userData['username'],
//                 sectionName: "Username",
//                 onPressed: () => editField("username"),
//               ),

//               // bio

//               MyTextbox(
//                 text: userData['bio'],
//                 sectionName: "Bio",
//                 onPressed: () => editField("bio"),
//               ),

//               // user posts

//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, top: 25.0),
//                 child: Text(
//                   'My Posts',
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//               ),
//             ]);
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error${snapshot.error}'),
//             );
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ), // StreamBuilder
//     );
//   }
// }

// NO ***************************************2************************************

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/text_box.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final currentUser = FirebaseAuth.instance.currentUser!;

//   final userCollection = FirebaseFirestore.instance.collection("users");
//   final postsCollection = FirebaseFirestore.instance.collection("posts");

//   Future<void> editField(String field) async {
//     String newValue = "";
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.grey[900],
//         title: Text(
//           "Edit $field",
//           style: const TextStyle(color: Colors.white),
//         ),
//         content: TextField(
//           autofocus: true,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: "Enter new $field",
//             hintStyle: TextStyle(color: Colors.grey),
//           ),
//           onChanged: (value) {
//             newValue = value;
//           },
//         ),
//         actions: [
//           TextButton(
//             child: Text(
//               'Cancel',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () => Navigator.pop(context),
//           ),
//           TextButton(
//             child: Text(
//               'Save',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () => Navigator.of(context).pop(newValue),
//           ),
//         ],
//       ),
//     );

//     if (newValue.isNotEmpty) {
//       await userCollection.doc(currentUser.uid).update({field: newValue});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text("Profile Page"),
//         backgroundColor: const Color.fromARGB(255, 190, 147, 228),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("users")
//             .doc(currentUser.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;

//             return FutureBuilder<QuerySnapshot>(
//               future: postsCollection
//                   .where('userId', isEqualTo: currentUser.uid)
//                   .get(),
//               builder: (context, postsSnapshot) {
//                 if (postsSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 if (postsSnapshot.hasError) {
//                   return Center(child: Text('Error: ${postsSnapshot.error}'));
//                 }

//                 final userPosts = postsSnapshot.data!.docs;

//                 return ListView(children: [
//                   SizedBox(height: 50),
//                   Icon(
//                     Icons.person,
//                     size: 72,
//                   ),
//                   Text(
//                     currentUser.email!,
//                     textAlign: TextAlign.center,
//                   ),
//                   MyTextbox(
//                     text: userData['username'],
//                     sectionName: "Username",
//                     onPressed: () => editField("username"),
//                   ),
//                   MyTextbox(
//                     text: userData['bio'],
//                     sectionName: "Bio",
//                     onPressed: () => editField("bio"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25.0, top: 25.0),
//                     child: Text(
//                       'My Posts',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ),
//                   // Display user posts
//                   for (var post in userPosts)
//                     ListTile(
//                       title: Text(post['text']),
//                       // Additional post details can be displayed here
//                     ),
//                 ]);
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

// ********************************************Updated****************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_alumnet/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final userCollection = FirebaseFirestore.instance.collection("users");
  final postsCollection = FirebaseFirestore.instance.collection("posts");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    if (newValue.isNotEmpty) {
      await userCollection.doc(currentUser.uid).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: const Color.fromARGB(255, 190, 147, 228),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return FutureBuilder<QuerySnapshot>(
              future: postsCollection
                  .where('userId', isEqualTo: currentUser.uid)
                  .get(),
              builder: (context, postsSnapshot) {
                if (postsSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (postsSnapshot.hasError) {
                  return Center(child: Text('Error: ${postsSnapshot.error}'));
                }

                final userPosts = postsSnapshot.data!.docs;

                return ListView(children: [
                  SizedBox(height: 50),
                  Icon(
                    Icons.person,
                    size: 72,
                  ),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                  ),
                  MyTextbox(
                    text: userData['username'],
                    sectionName: "Username",
                    onPressed: () => editField("username"),
                  ),
                  MyTextbox(
                    text: userData['bio'],
                    sectionName: "Bio",
                    onPressed: () => editField("bio"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: Text(
                      'My Posts',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  // Display user posts in rows
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: userPosts
                          .map((post) => Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 16,
                                height:
                                    MediaQuery.of(context).size.width / 3 - 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(post['imagePath']),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
