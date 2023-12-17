// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";
//   late String _userId; // Variable to store the current user's ID

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUser();
//   }

//   // Function to get the current user's ID
//   void _getCurrentUser() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             // fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/notification_page');
//               },
//               icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: const MyDrawer(),
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text('No posts available.'),
//               );
//             }

//             return SingleChildScrollView(
//               child: Column(
//                 children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                   return PostWidget(post: post, userId: _userId);
//                 }).toList(),
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: const MyBottomNavBar(),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final DocumentSnapshot post;
//   final String userId;

//   const PostWidget({super.key, required this.post, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = post.data() as Map<String, dynamic>;
//     String postText = data['text'];
//     String postImage = data['imagePath'] ?? '';
//     String postUserId = data['userId'];

//     return Container(
//       margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                 // You can use a user's profile image here
//                 backgroundColor: Colors.deepPurple,
//                 child: Text(
//                   postUserId.substring(0, 1).toUpperCase(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               title: FutureBuilder(
//                 future: _getUsername(postUserId),
//                 builder: (context, AsyncSnapshot<String> usernameSnapshot) {
//                   if (usernameSnapshot.connectionState ==
//                       ConnectionState.waiting) {
//                     return const LinearProgressIndicator();
//                   }

//                   if (usernameSnapshot.hasError) {
//                     return Text('Error: ${usernameSnapshot.error}');
//                   }

//                   return Text(
//                     '${usernameSnapshot.data}',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           if (postImage.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(5.0),
//                 child: Image.network(
//                   postImage,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               postText,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to get the username based on userId
//   Future<String> _getUsername(String userId) async {
//     try {
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users') // Update this to your users collection
//           .doc(userId)
//           .get();
//       return userSnapshot['username'];
//     } catch (e) {
//       print('Error fetching username: $e');
//       return '';
//     }
//   }
// }

// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";
//   late String _userId; // Variable to store the current user's ID

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUser();
//   }

//   // Function to get the current user's ID
//   void _getCurrentUser() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/notification_page');
//             },
//             icon: const Icon(Icons.notifications),
//           )
//         ],
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text('No posts available.'),
//               );
//             }

//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                 return Column(
//                   children: [
//                     PostWidget(post: post, userId: _userId),
//                     const Divider(), // Add a divider between posts
//                   ],
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: const MyBottomNavBar(),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final DocumentSnapshot post;
//   final String userId;

//   const PostWidget({Key? key, required this.post, required this.userId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = post.data() as Map<String, dynamic>;
//     String postText = data['text'];
//     String postImage = data['imagePath'] ?? '';
//     String postUserId = data['userId'];
//     Timestamp timestamp = data['timestamp'] as Timestamp;

//     return Container(
//       margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.deepPurple,
//                 child: Text(
//                   postUserId.substring(0, 1).toUpperCase(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               title: FutureBuilder(
//                 future: _getUsername(postUserId),
//                 builder: (context, AsyncSnapshot<String> usernameSnapshot) {
//                   if (usernameSnapshot.connectionState ==
//                       ConnectionState.waiting) {
//                     return const LinearProgressIndicator();
//                   }

//                   if (usernameSnapshot.hasError) {
//                     return Text('Error: ${usernameSnapshot.error}');
//                   }

//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${usernameSnapshot.data}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         _formatTimestamp(timestamp),
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           if (postImage.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(5.0),
//                 child: Image.network(
//                   postImage,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               postText,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<String> _getUsername(String userId) async {
//     try {
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users') // Update this to your users collection
//           .doc(userId)
//           .get();
//       return userSnapshot['username'];
//     } catch (e) {
//       print('Error fetching username: $e');
//       return '';
//     }
//   }

//   String _formatTimestamp(Timestamp timestamp) {
//     DateTime dateTime = timestamp.toDate();
//     return DateFormat('MMM dd, yyyy - HH:mm a').format(dateTime);
//   }
// }

// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";
//   late String _userId; // Variable to store the current user's ID

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUser();
//   }

//   // Function to get the current user's ID
//   void _getCurrentUser() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _userId = user.uid;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/notification_page');
//             },
//             icon: const Icon(Icons.notifications),
//           )
//         ],
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text('No posts available.'),
//               );
//             }

//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                 return PostWidget(post: post, userId: _userId);
//               }).toList(),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: const MyBottomNavBar(),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final DocumentSnapshot post;
//   final String userId;

//   const PostWidget({Key? key, required this.post, required this.userId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = post.data() as Map<String, dynamic>;
//     String postText = data['text'];
//     String postImage = data['imagePath'] ?? '';
//     String postUserId = data['userId'];
//     Timestamp timestamp = data['timestamp'] as Timestamp;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListTile(
//             leading: CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage('assets/default_profile_image.jpg'),
//             ),
//             title: Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: FutureBuilder(
//                 future: _getUsername(postUserId),
//                 builder: (context, AsyncSnapshot<String> usernameSnapshot) {
//                   if (usernameSnapshot.connectionState ==
//                       ConnectionState.waiting) {
//                     return const LinearProgressIndicator();
//                   }

//                   if (usernameSnapshot.hasError) {
//                     return Text('Error: ${usernameSnapshot.error}');
//                   }

//                   return Row(
//                     children: [
//                       Text(
//                         '${usernameSnapshot.data}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Icon(
//                         Icons.verified,
//                         color: Colors.blue,
//                         size: 16,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//         if (postImage.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Image.network(
//                 postImage,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
//           child: Text(
//             postText,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.favorite_outline, size: 24),
//                   const SizedBox(width: 8),
//                   Text(
//                     '123 likes',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 _formatTimestamp(timestamp),
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(), // Add a divider between posts
//       ],
//     );
//   }

//   Future<String> _getUsername(String userId) async {
//     try {
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users') // Update this to your users collection
//           .doc(userId)
//           .get();
//       return userSnapshot['username'];
//     } catch (e) {
//       print('Error fetching username: $e');
//       return '';
//     }
//   }

//   String _formatTimestamp(Timestamp timestamp) {
//     DateTime dateTime = timestamp.toDate();
//     return DateFormat('MMM dd, yyyy').format(dateTime);
//   }
// }

import 'package:demo_alumnet/components/my_bottom_navbar.dart';
import 'package:demo_alumnet/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = "AlumNet";
  late String _userId; // Variable to store the current user's ID

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  // Function to get the current user's ID
  void _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification_page');
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No posts available.'),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: snapshot.data!.docs.map((DocumentSnapshot post) {
                  return PostWidget(post: post, userId: _userId);
                }).toList(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class PostWidget extends StatefulWidget {
  final DocumentSnapshot post;
  final String userId;

  const PostWidget({Key? key, required this.post, required this.userId})
      : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = widget.post.data() as Map<String, dynamic>;
    String postText = data['text'];
    String postImage = data['imagePath'] ?? '';
    String postUserId = data['userId'];
    // Timestamp timestamp = data['timestamp'] as Timestamp;
    int likesCount = data['likesCount'] ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/default_profile_image.jpg'),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FutureBuilder(
                future: _getUsername(postUserId),
                builder: (context, AsyncSnapshot<String> usernameSnapshot) {
                  if (usernameSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const LinearProgressIndicator();
                  }

                  if (usernameSnapshot.hasError) {
                    return Text('Error: ${usernameSnapshot.error}');
                  }

                  return Text(
                    '${usernameSnapshot.data}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        if (postImage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                postImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8.0, 24.0, 16),
          child: Text(
            postText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _toggleLike(widget.post.reference);
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline,
                      size: 24,
                      color: isLiked ? Colors.red : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$likesCount likes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Text(
              //   _formatTimestamp(timestamp),
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 12,
              //   ),
              // ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  void _toggleLike(DocumentReference postRef) {
    // Toggle the like state locally
    setState(() {
      isLiked = !isLiked;
    });

    // Update the like count in Firestore
    postRef.update({
      'likesCount':
          isLiked ? FieldValue.increment(1) : FieldValue.increment(-1),
    });
  }

  Future<String> _getUsername(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users') // Update this to your users collection
          .doc(userId)
          .get();
      return userSnapshot['username'];
    } catch (e) {
      print('Error fetching username: $e');
      return '';
    }
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}


// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Text('Posts'),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('posts').snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }

//                   if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   }

//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Text('No posts available.');
//                   }

//                   return Column(
//                     children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                       Map<String, dynamic> data =
//                           post.data() as Map<String, dynamic>;
//                       String postText = data['text'];
//                       String postImage =
//                           data['imagePath'] ?? ''; // Image is optional
//                       // You can customize the post widget as needed
//                       return Card(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text(postText),
//                             ),
//                             if (postImage.isNotEmpty)
//                               Image.network(
//                                 postImage,
//                                 height: 200,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Center(
//                 child: Text('No posts available.'),
//               );
//             }

//             return SingleChildScrollView(
//               child: Column(
//                 children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                   return PostWidget(post: post);
//                 }).toList(),
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final DocumentSnapshot post;

//   const PostWidget({Key? key, required this.post}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = post.data() as Map<String, dynamic>;
//     String postText = data['text'];
//     String postImage = data['imagePath'] ?? '';

//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(postText),
//           ),
//           if (postImage.isNotEmpty)
//             Image.network(
//               postImage,
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('posts').snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }

//                   if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   }

//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Text('No posts available.');
//                   }

//                   return Column(
//                     children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                       Map<String, dynamic> data =
//                           post.data() as Map<String, dynamic>;
//                       String postText = data['text'];
//                       String postImage =
//                           data['imagePath'] ?? ''; // Image is optional
//                       String username = data['username'];
//                       // DateTime timestamp = (data['timestamp'] as Timestamp).toDate();

//                       // You can customize the post widget as needed
//                       return Card(
//                         margin: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text(postText),
//                               subtitle: Text(
//                                 'Posted by $username',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             if (postImage.isNotEmpty)
//                               Image.network(
//                                 postImage,
//                                 height: 200,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_alumnet/components/my_bottom_navbar.dart';
// import 'package:demo_alumnet/components/my_drawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String appTitle = "AlumNet";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           appTitle,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('posts').snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }

//                   if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   }

//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Text('No posts available.');
//                   }

//                   return Column(
//                     children: snapshot.data!.docs.map((DocumentSnapshot post) {
//                       Map<String, dynamic> data =
//                           post.data() as Map<String, dynamic>;
//                       String postText = data['text'];
//                       String postImage =
//                           data['imagePath'] ?? ''; // Image is compulsory
//                       String username = data['username'];

//                       if (postImage.isEmpty) {
//                         // Skip posts without images
//                         return SizedBox.shrink();
//                       }

//                       return PostWidget(
//                         username: username,
//                         text: postText,
//                         imageUrl: postImage,
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final String username;
//   final String text;
//   final String imageUrl;

//   PostWidget({
//     required this.username,
//     required this.text,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Padding(
//         padding: EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(text),
//             SizedBox(height: 8),
//             Image.network(
//               imageUrl,
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


























































//   //build a list of users except the current logged-in user
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
//   Widget _buildUserListItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

//     // display all users except the current user
//     if (_auth.currentUser!.email != data['username']) {
//       return ListTile(
//         title: Text(data['username']), // Use const for static text
//         onTap: () {
//           // go to the chat screen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ChatPage(
//                 receiverUserEmail: data['username'],
//                 receiverUserid: data['uid'],
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       // return an empty container
//       return Container();
//     }
//   }
// }

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
