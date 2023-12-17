// import 'package:demo_alumnet/firebase_options.dart';
// import 'package:demo_alumnet/model/post_page.dart';
// import 'package:demo_alumnet/screens/aboutus_page.dart';
// import 'package:demo_alumnet/screens/contact_us.dart';
// import 'package:demo_alumnet/screens/home_screen.dart';
// import 'package:demo_alumnet/screens/chat_list.dart';
// import 'package:demo_alumnet/screens/members_list.dart';
// import 'package:demo_alumnet/screens/notification_screen.dart';
// import 'package:demo_alumnet/screens/profile_screen.dart';
// import 'package:demo_alumnet/screens/settings_screen.dart';
// import 'package:demo_alumnet/services/auth/auth_gate.dart';
// import 'package:demo_alumnet/services/auth/auth_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:demo_alumnet/services/auth/login_or_register.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(ChangeNotifierProvider(
//     create: (context) => AuthService(),
//     child: const MainApp(),
//   ));
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//       routes: {
//         '/login_register_page': (context) => const LoginOrRegister(),
//         '/home_page': (context) => const HomePage(),
//         '/profile_page': (context) => const ProfilePage(),
//         '/chat_page': (context) => const MembersPage(),
//         '/members_list': (context) => const MembersList(),
//         '/aboutus_page': (context) => const AboutUsPage(),
//         '/settings_page': (context) => const SettingsPage(),
//         '/contacts_page': (context) => const ContactUs(),
//         '/posting_page': (context) =>  const PostPage(),
//         '/notification_page': (context) =>  const NotificationPage(),
//       },
//     );
//   }
// }

//  ************************** Adding notifications************************************

import 'package:demo_alumnet/firebase_options.dart';
import 'package:demo_alumnet/model/post_page.dart';
import 'package:demo_alumnet/screens/aboutus_page.dart';
import 'package:demo_alumnet/screens/contact_us.dart';
import 'package:demo_alumnet/screens/home_screen.dart';
import 'package:demo_alumnet/screens/chat_list.dart';
import 'package:demo_alumnet/screens/members_list.dart';
import 'package:demo_alumnet/screens/notification_screen.dart';
import 'package:demo_alumnet/screens/profile_screen.dart';
import 'package:demo_alumnet/screens/settings_screen.dart';
import 'package:demo_alumnet/services/Notifications/firebase_api.dart';
import 'package:demo_alumnet/services/auth/auth_gate.dart';
import 'package:demo_alumnet/services/auth/auth_service.dart';
import 'package:demo_alumnet/services/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifiction();

  // // Initialize Firebase Cloud Messaging
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/chat_page': (context) => const MembersPage(),
        '/members_list': (context) => const MembersList(),
        '/aboutus_page': (context) => const AboutUsPage(),
        '/settings_page': (context) => const SettingsPage(),
        '/contacts_page': (context) => const ContactUs(),
        '/posting_page': (context) => const PostPage(),
        '/notification_page': (context) => const NotificationPage(),
      },
    );
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message: ${message.messageId}');
//   // Handle the incoming message, e.g., show a notification
// }
