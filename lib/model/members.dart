import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  String uid;
  String username;
  String bio;
  // String profilePictureUrl;

  Member({
    required this.uid,
    required this.username,
    required this.bio,
  }); //  this.profilePictureUrl
}

class AllMembersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllMembers(),
      builder: (context, AsyncSnapshot<List<Member>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Member> members = snapshot.data!;
          return ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              Member member = members[index];
              return ListTile(
                // leading: CircleAvatar(
                // backgroundImage: NetworkImage(member.profilePictureUrl),
                // ),
                title: Text(member.username),
                subtitle: Text(member.bio),
                // Add more UI elements as needed
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
      // profilePictureUrl: doc['profilePictureUrl'],
    ));
  }

  return members;
}
