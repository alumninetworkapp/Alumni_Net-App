import 'package:demo_alumnet/components/my_bottom_navbar.dart';
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
        title: const Text('Members'),
      ),
      body: const AllMembersWidget(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
