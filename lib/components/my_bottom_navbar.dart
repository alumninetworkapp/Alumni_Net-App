import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepPurple[600],
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: true,
                  onPressed: () {
                    //call function selected
                    Navigator.pushNamed(context, '/home_page');
                  }),
              IconBottomBar(
                  text: "Members",
                  icon: Icons.people,
                  selected: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/members_list');
                  }),
              IconBottomBar2(
                  text: "Add Post",
                  icon: Icons.add,
                  selected: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/posting_page');
                  }),
              IconBottomBar(
                  text: "Messages",
                  icon: Icons.message_outlined,
                  selected: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat_page');
                  }),
              IconBottomBar(
                  text: "Settings",
                  icon: Icons.list,
                  selected: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings_page');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? Colors.white : Colors.black54,
          ),
        ),
      ],
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  const IconBottomBar2(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final primaryColor = const Color(0xff4338CA);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
