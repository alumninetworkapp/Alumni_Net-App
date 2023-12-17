//   *********************************************  Final Code  *************************************************

import 'package:demo_alumnet/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  String uid;
  String username;
  String bio;

  Member({
    required this.uid,
    required this.username,
    required this.bio,
  });
}

class AllMembersWidget extends StatelessWidget {
  const AllMembersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllMembers(),
      builder: (context, AsyncSnapshot<List<Member>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Member> members = snapshot.data!;
          return ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              Member member = members[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to UserProfilePage with the selected user's uid
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfilePage(uid: member.uid),
                    ),
                  );
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.person_4_sharp,
                    size: 50.0,
                    color: Colors.black,
                  ),
                  title: Text(member.username),
                  subtitle: Text("   - ${member.bio}"),
                  // trailing: const Icon(
                  //   Icons.chat,
                  //   size: 40.0,
                  //   color: Colors.blue,
                  // )
                ),
              );
            },
          );
        }
      },
    );
  }
}

Future<List<Member>> getAllMembers() async {
  QuerySnapshot<Map<String, dynamic>> membersSnapshot =
      await FirebaseFirestore.instance.collection('users').get();

  List<Member> members = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> doc
      in membersSnapshot.docs) {
    members.add(Member(
      uid: doc.id,
      username: doc['username'],
      bio: doc['bio'],
    ));
  }

  return members;
}

// import 'package:demo_alumnet/screens/user_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Member {
//   String uid;
//   String username;
//   String bio;

//   Member({
//     required this.uid,
//     required this.username,
//     required this.bio,
//   });
// }

// class AllMembersWidget extends StatelessWidget {
//   const AllMembersWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllMembers(),
//       builder: (context, AsyncSnapshot<List<Member>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<Member> members = snapshot.data!;
//           return ListView.builder(
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               Member member = members[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to UserProfilePage with the selected user's uid
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserProfilePage(uid: member.uid),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   title: Text(member.username),
//                   subtitle: Text(member.bio),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// Future<List<Member>> getAllMembers() async {
//   QuerySnapshot<Map<String, dynamic>> membersSnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   List<Member> members = [];

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//       in membersSnapshot.docs) {
//     members.add(Member(
//       uid: doc.id,
//       username: doc['username'],
//       bio: doc['bio'],
//     ));
//   }

//   return members;
// }


// ***************************************Updated*********************************

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Member {
//   String uid;
//   String username;
//   String bio;
//   // String profilePictureUrl;

//   Member({
//     required this.uid,
//     required this.username,
//     required this.bio,
//   }); //  this.profilePictureUrl
// }

// class AllMembersWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllMembers(),
//       builder: (context, AsyncSnapshot<List<Member>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//               child:
//                   CircularProgressIndicator()); // Loading indicator while fetching data
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<Member> members = snapshot.data!;
//           return ListView.builder(
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               Member member = members[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to the user's profile page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           UserProfilePage(username: member.username),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   // leading: CircleAvatar(
//                   // backgroundImage: NetworkImage(member.profilePictureUrl),
//                   // ),
//                   title: Text(member.username),
//                   subtitle: Text(member.bio),
//                   // Add more UI elements as needed
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class UserProfilePage extends StatelessWidget {
//   final String username;

//   const UserProfilePage({Key? key, required this.username}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$username\'s Profile'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection("users")
//             .where('username', isEqualTo: username)
//             .limit(1)
//             .snapshots(), // Remove snapshots() here
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//             final userData =
//                 snapshot.data!.docs.first.data() as Map<String, dynamic>;

//             return ListView(
//               children: [
//                 SizedBox(height: 20),
//                 Center(
//                   child: CircleAvatar(
//                     radius: 60,
//                     // You can use NetworkImage if you have a URL, or AssetImage for a local image
//                     // backgroundImage: NetworkImage(userData['profilePictureUrl']),
//                     // Example using AssetImage:
//                     backgroundImage:
//                         AssetImage('assets/profile_placeholder.png'),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Username: ${userData['username']}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Bio: ${userData['bio']}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 // Add more user details as needed
//               ],
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

// Future<List<Member>> getAllMembers() async {
//   QuerySnapshot<Map<String, dynamic>> membersSnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   List<Member> members = [];

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//       in membersSnapshot.docs) {
//     members.add(Member(
//       uid: doc.id,
//       username: doc['username'],
//       bio: doc['bio'],
//       // profilePictureUrl: doc['profilePictureUrl'],
//     ));
//   }

//   return members;
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Members'),
//       ),
//       body: AllMembersWidget(),
//     ),
//   ));
// }

// *********************************Working*************************************

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Member {
//   String uid;
//   String username;
//   String bio;

//   Member({
//     required this.uid,
//     required this.username,
//     required this.bio,
//   });
// }

// class AllMembersWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllMembers(),
//       builder: (context, AsyncSnapshot<List<Member>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<Member> members = snapshot.data!;
//           return ListView.builder(
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               Member member = members[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           UserProfilePage(username: member.username),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   title: Text(member.username),
//                   subtitle: Text(member.bio),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class UserProfilePage extends StatelessWidget {
//   final String username;

//   const UserProfilePage({Key? key, required this.username}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$username\'s Profile'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection("users")
//             .where('username', isEqualTo: username)
//             .limit(1)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//             final userData =
//                 snapshot.data!.docs.first.data() as Map<String, dynamic>;

//             return Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 20),
//                   CircleAvatar(
//                     radius: 60,
//                     // You can use NetworkImage if you have a URL, or AssetImage for a local image
//                     // backgroundImage: NetworkImage(userData['profilePictureUrl']),
//                     // Example using AssetImage:
//                     backgroundImage:
//                         AssetImage('assets/profile_placeholder.png'),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     userData['username'],
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: MyTextbox(
//                       sectionName: 'Bio:',
//                       text: userData['bio'],
//                     ),
//                   ),
//                 ],
//               ),
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

// class MyTextbox extends StatelessWidget {
//   final String text;
//   final String sectionName;

//   const MyTextbox({
//     Key? key,
//     required this.text,
//     required this.sectionName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(15),
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 sectionName,
//                 style: TextStyle(color: Colors.grey[500]),
//               ),
//             ],
//           ),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }

// Future<List<Member>> getAllMembers() async {
//   QuerySnapshot<Map<String, dynamic>> membersSnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   List<Member> members = [];

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//       in membersSnapshot.docs) {
//     members.add(Member(
//       uid: doc.id,
//       username: doc['username'],
//       bio: doc['bio'],
//     ));
//   }

//   return members;
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Members'),
//       ),
//       body: AllMembersWidget(),
//     ),
//   ));
// }

// *************************************************Updating******************************************

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Member {
//   String uid;
//   String username;
//   String bio;

//   Member({
//     required this.uid,
//     required this.username,
//     required this.bio,
//   });
// }

// class AllMembersWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllMembers(),
//       builder: (context, AsyncSnapshot<List<Member>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<Member> members = snapshot.data!;
//           return ListView.builder(
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               Member member = members[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserProfilePage(uid: member.uid),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   title: Text(member.username),
//                   subtitle: Text(member.bio),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class UserProfilePage extends StatelessWidget {
//   final String uid;

//   const UserProfilePage({Key? key, required this.uid}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: StreamBuilder(
//         stream:
//             FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.exists) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;

//             return Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 20),
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage:
//                         AssetImage('assets/profile_placeholder.png'),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     userData['username'],
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: MyTextbox(
//                       sectionName: 'Bio:',
//                       text: userData['bio'],
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     'User Posts:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   FutureBuilder<QuerySnapshot>(
//                     future: FirebaseFirestore.instance
//                         .collection('posts')
//                         .where('userId', isEqualTo: uid)
//                         .get(),
//                     builder: (context, postsSnapshot) {
//                       if (postsSnapshot.connectionState ==
//                           ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       }

//                       if (postsSnapshot.hasError) {
//                         return Center(
//                             child: Text('Error: ${postsSnapshot.error}'));
//                       }

//                       final userPosts = postsSnapshot.data!.docs;

//                       return Padding(
//                         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             for (int i = 0; i < userPosts.length; i += 3)
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   for (int j = i;
//                                       j < i + 3 && j < userPosts.length;
//                                       j++)
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(5),
//                                         child: Image.network(
//                                           userPosts[j]['imagePath'],
//                                           height: 100,
//                                           width: 100,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
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

// class MyTextbox extends StatelessWidget {
//   final String text;
//   final String sectionName;

//   const MyTextbox({
//     Key? key,
//     required this.text,
//     required this.sectionName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(15),
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 sectionName,
//                 style: TextStyle(color: Colors.grey[500]),
//               ),
//             ],
//           ),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }

// Future<List<Member>> getAllMembers() async {
//   QuerySnapshot<Map<String, dynamic>> membersSnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   List<Member> members = [];

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//       in membersSnapshot.docs) {
//     members.add(Member(
//       uid: doc.id,
//       username: doc['username'],
//       bio: doc['bio'],
//     ));
//   }

//   return members;
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Members'),
//       ),
//       body: AllMembersWidget(),
//     ),
//   ));
// }

//  ****************************************INtegrated with Profile***************************************

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Member {
//   String uid;
//   String username;
//   String bio;

//   Member({
//     required this.uid,
//     required this.username,
//     required this.bio,
//   });
// }

// class AllMembersWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllMembers(),
//       builder: (context, AsyncSnapshot<List<Member>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<Member> members = snapshot.data!;
//           return ListView.builder(
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               Member member = members[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserProfilePage(uid: member.uid),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   title: Text(member.username),
//                   subtitle: Text(member.bio),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class UserProfilePage extends StatelessWidget {
//   final String uid;

//   const UserProfilePage({Key? key, required this.uid}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: StreamBuilder(
//         stream:
//             FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.exists) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;

//             return SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20),
//                     CircleAvatar(
//                       radius: 60,
//                       backgroundImage:
//                           AssetImage('assets/profile_placeholder.png'),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       userData['username'],
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                       child: MyTextbox(
//                         sectionName: 'Bio:',
//                         text: userData['bio'],
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Text(
//                       'User Posts:',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     FutureBuilder<QuerySnapshot>(
//                       future: FirebaseFirestore.instance
//                           .collection('posts')
//                           .where('userId', isEqualTo: uid)
//                           .get(),
//                       builder: (context, postsSnapshot) {
//                         if (postsSnapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(child: CircularProgressIndicator());
//                         }

//                         if (postsSnapshot.hasError) {
//                           return Center(
//                             child: Text('Error: ${postsSnapshot.error}'),
//                           );
//                         }

//                         final userPosts = postsSnapshot.data!.docs;

//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             for (int i = 0; i < userPosts.length; i += 3)
//                               SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     for (int j = i;
//                                         j < i + 3 && j < userPosts.length;
//                                         j++)
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           child: Image.network(
//                                             userPosts[j]['imagePath'],
//                                             height: 100,
//                                             width: 100,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
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

// class MyTextbox extends StatelessWidget {
//   final String text;
//   final String sectionName;

//   const MyTextbox({
//     Key? key,
//     required this.text,
//     required this.sectionName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(15),
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 sectionName,
//                 style: TextStyle(color: Colors.grey[500]),
//               ),
//             ],
//           ),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }

// Future<List<Member>> getAllMembers() async {
//   QuerySnapshot<Map<String, dynamic>> membersSnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   List<Member> members = [];

//   for (QueryDocumentSnapshot<Map<String, dynamic>> doc
//       in membersSnapshot.docs) {
//     members.add(Member(
//       uid: doc.id,
//       username: doc['username'],
//       bio: doc['bio'],
//     ));
//   }

//   return members;
// }
