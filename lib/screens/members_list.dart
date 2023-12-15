import 'package:demo_alumnet/model/members.dart';
import 'package:flutter/material.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
      body: AllMembersWidget(),
    );
  }
}
