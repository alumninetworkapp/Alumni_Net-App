// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   File? _image;
//   TextEditingController _textEditingController = TextEditingController();

//   Future<void> _getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }

//   Future<void> _uploadPost() async {
//     try {
//       String text = _textEditingController.text.trim();
//       String imagePath = "";

//       if (_image != null) {
//         firebase_storage.Reference storageReference =
//             firebase_storage.FirebaseStorage.instance.ref().child(
//                 'images/${DateTime.now().millisecondsSinceEpoch.toString()}');
//         firebase_storage.UploadTask uploadTask =
//             storageReference.putFile(_image!);

//         await uploadTask.whenComplete(() async {
//           await storageReference.getDownloadURL().then((fileURL) {
//             imagePath = fileURL;
//           });
//         });
//       }

//       await FirebaseFirestore.instance.collection('posts').add({
//         'text': text,
//         'imagePath': imagePath,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       Navigator.pop(context); // Close the post page after posting
//     } catch (e) {
//       print("Error uploading post: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create a Post'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: _uploadPost,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _textEditingController,
//               decoration: InputDecoration(labelText: 'Write something...'),
//               maxLines: null,
//             ),
//             SizedBox(height: 16),
//             _image != null
//                 ? Image.file(_image!, height: 150)
//                 : SizedBox.shrink(),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: Text('Select Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   File? _image;
//   TextEditingController _textEditingController = TextEditingController();
//   String? _userId; // Variable to store the current user's ID

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

//   Future<void> _getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }

//   Future<void> _uploadPost() async {
//     try {
//       String text = _textEditingController.text.trim();
//       String imagePath = "";
//       String postId = DateTime.now().millisecondsSinceEpoch.toString();

//       if (_image != null) {
//         firebase_storage.Reference storageReference =
//             firebase_storage.FirebaseStorage.instance.ref().child(
//                   'images/$postId',
//                 );
//         firebase_storage.UploadTask uploadTask =
//             storageReference.putFile(_image!);

//         await uploadTask.whenComplete(() async {
//           imagePath = await storageReference.getDownloadURL();
//         });
//       }

//       // Add the postId and userId to the post data
//       await FirebaseFirestore.instance.collection('posts').add({
//         'postId': postId,
//         'userId': _userId,
//         'text': text,
//         'imagePath': imagePath,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       Navigator.pop(context); // Close the post page after posting
//     } catch (e) {
//       print("Error uploading post: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create a Post'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: _uploadPost,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _textEditingController,
//               decoration: InputDecoration(labelText: 'Write something...'),
//               maxLines: null,
//             ),
//             SizedBox(height: 16),
//             _image != null
//                 ? Image.file(_image!, height: 150)
//                 : SizedBox.shrink(),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: Text('Select Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// *************************************Main*******************************

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   File? _image;
//   TextEditingController _textEditingController = TextEditingController();
//   String? _userId; // Variable to store the current user's ID

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

//   Future<void> _getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }

//   Future<void> _uploadPost() async {
//     try {
//       String text = _textEditingController.text.trim();
//       String imagePath = "";
//       String postId = DateTime.now().millisecondsSinceEpoch.toString();

//       if (_image != null) {
//         firebase_storage.Reference storageReference =
//             firebase_storage.FirebaseStorage.instance.ref().child(
//                   'images/$postId',
//                 );
//         firebase_storage.UploadTask uploadTask =
//             storageReference.putFile(_image!);

//         await uploadTask.whenComplete(() async {
//           imagePath = await storageReference.getDownloadURL();
//         });
//       }

//       // Fetch the username from Firestore
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users') // Update this to your users collection
//           .doc(_userId)
//           .get();
//       String username = userSnapshot['username'];

//       // Add the postId, userId, and username to the post data
//       await FirebaseFirestore.instance.collection('posts').add({
//         'postId': postId,
//         'userId': _userId,
//         'username': username, // Use the fetched username
//         'text': text,
//         'imagePath': imagePath,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       Navigator.pop(context); // Close the post page after posting
//     } catch (e) {
//       print("Error uploading post: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create a Post'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: _uploadPost,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _textEditingController,
//               decoration: InputDecoration(labelText: 'Write something...'),
//               maxLines: null,
//             ),
//             SizedBox(height: 16),
//             _image != null
//                 ? Image.file(_image!, height: 150)
//                 : SizedBox.shrink(),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: Text('Select Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';
// import 'dart:io';

// class Post {
//   final String postId;
//   final String userId;
//   final String username;
//   final String text;
//   final String imageUrl;

//   Post({
//     required this.postId,
//     required this.userId,
//     required this.username,
//     required this.text,
//     required this.imageUrl,
//   });
// }

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   late TextEditingController _textController;
//   File? _image;
//   String _username = '';

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//     _loadUsername();
//   }

//   Future<void> _loadUsername() async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;

//     try {
//       final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

//       if (userDoc.exists) {
//         setState(() {
//           _username = userDoc['username'];
//         });
//       } else {
//         print('User document not found for userId: $userId');
//       }
//     } catch (e) {
//       print('Error loading username: $e');
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

//     setState(() {
//       _image = File(pickedFile!.path);
//     });
//   }

//   Future<void> _uploadPost() async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;

//     if (_image == null) {
//       // Show an error message or prevent post upload if no image is selected
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Please pick an image before posting.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     }

//     String imageUrl = '';

//     final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
//     await storageRef.putFile(_image!);

//     // Debug prints
//     print('Image URL after uploading: $imageUrl');

//     imageUrl = await storageRef.getDownloadURL();

//     await FirebaseFirestore.instance.collection('posts').add({
//       'userId': userId,
//       'username': _username,
//       'text': _textController.text,
//       'imageUrl': imageUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     _textController.clear();
//     setState(() {
//       _image = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _textController,
//               maxLines: 4,
//               decoration: InputDecoration(labelText: 'Enter your post'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 16),
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadPost,
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   late TextEditingController _textController;
//   File? _image;
//   String _username = '';

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//     _loadUsername();
//   }

//   Future<void> _loadUsername() async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;

//     try {
//       // Retrieve the user document from Firestore
//       final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

//       if (userDoc.exists) {
//         setState(() {
//           _username = userDoc['username'];
//         });
//       } else {
//         // Handle the case where the user document doesn't exist
//         print('User document not found for userId: $userId');
//       }
//     } catch (e) {
//       print('Error loading username: $e');
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

//     setState(() {
//       _image = File(pickedFile!.path);
//     });
//   }

//   Future<void> _uploadPost() async {
//     final userId = FirebaseAuth.instance.currentUser!.uid;

//     String imageUrl = '';

//     if (_image != null) {
//       final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
//       await storageRef.putFile(_image!);
//       imageUrl = await storageRef.getDownloadURL();
//     }

//     await FirebaseFirestore.instance.collection('posts').add({
//       'userId': userId,
//       'username': _username,
//       'text': _textController.text,
//       'imageUrl': imageUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     _textController.clear();
//     setState(() {
//       _image = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _textController,
//               maxLines: 4,
//               decoration: InputDecoration(labelText: 'Enter your post'),
//             ),
//             SizedBox(height: 16),
//             _image == null
//                 ? ElevatedButton(
//                     onPressed: _pickImage,
//                     child: Text('Pick Image'),
//                   )
//                 : Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadPost,
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {

//   final currentUser = FirebaseAuth.instance.currentUser!;

//   final userId = FirebaseAuth.instance.currentUser!.uid;

//   final userCollection = FirebaseFirestore.instance.collection("users");

//   late TextEditingController _textController;

//   File? _image;

//   @override
//   void initState() {
//     super.initState();
//     _textController = TextEditingController();
//   }

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);

//     setState(() {
//       _image = File(pickedFile!.path);
//     });
//   }

//   Future<void> _uploadPost() async {

//     DocumentSnapshot userSnapshot = await userCollection.doc("userId").get();

//     final username = userSnapshot.get("username");

//     String imageUrl = '';

//     // Upload image to Firebase Storage if an image is selected.
//     if (_image != null) {
//       final storageRef =
//           FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
//       await storageRef.putFile(_image!);
//       imageUrl = await storageRef.getDownloadURL();
//     }

//     // Add post data to Firestore.
//     await FirebaseFirestore.instance.collection('posts').add({
//       'userId': userId,
//       'username': username,
//       'text': _textController.text,
//       'imageUrl': imageUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     // Clear text and image controllers.
//     _textController.clear();
//     setState(() {
//       _image = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _textController,
//               maxLines: 4,
//               decoration: InputDecoration(labelText: 'Enter your post'),
//             ),
//             SizedBox(height: 16),
//             _image == null
//                 ? ElevatedButton(
//                     onPressed: _pickImage,
//                     child: Text('Pick Image'),
//                   )
//                 : Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadPost,
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// **************************************new*************************************************

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? _image;
  TextEditingController _textEditingController = TextEditingController();
  String? _userId; // Variable to store the current user's ID

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

  Future<void> _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _uploadPost() async {
    try {
      String text = _textEditingController.text.trim();

      if (_image == null) {
        // Show an error message because image is mandatory
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an image.'),
          ),
        );
        return;
      }

      String imagePath = "";
      String postId = DateTime.now().millisecondsSinceEpoch.toString();

      firebase_storage.Reference storageReference =
          firebase_storage.FirebaseStorage.instance.ref().child(
                'images/$postId',
              );
      firebase_storage.UploadTask uploadTask =
          storageReference.putFile(_image!);

      await uploadTask.whenComplete(() async {
        imagePath = await storageReference.getDownloadURL();
      });

      // Fetch the username from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users') // Update this to your users collection
          .doc(_userId)
          .get();
      String username = userSnapshot['username'];

      // Add the postId, userId, and username to the post data
      await FirebaseFirestore.instance.collection('posts').add({
        'postId': postId,
        'userId': _userId,
        'username': username, // Use the fetched username
        'text': text,
        'imagePath': imagePath,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context); // Close the post page after posting
    } catch (e) {
      print("Error uploading post: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _uploadPost,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Write something...'),
              maxLines: null,
            ),
            SizedBox(height: 16),
            _image != null
                ? Image.file(_image!, height: 150)
                : SizedBox.shrink(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
