import 'package:flutter/material.dart';
import 'package:poem/screens/about.dart';
import 'package:poem/screens/contacts.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/main_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/screens/user_screen.dart';
import 'package:poem/screens/welcome_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poem Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Welcome(),
      routes: {
        '/signup': (context) => const SignUp(),
        '/signin': (context) => const LoginPage(),
        '/welcome': (context) => const Welcome(),
        '/contact': (context) => const Contact(),
        '/about': (context) => const About(),
        '/userPage': (context) => UserApp(),
        '/mainAdminPage': (context) => const MyApp(),
      },
    );
  }
}
