import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem/Providers/router_provider.dart';
import 'package:poem/screens/about.dart';
import 'package:poem/screens/admin_main_page.dart';
import 'package:poem/screens/contacts.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/screens/user_screen.dart';
import 'package:poem/screens/welcome_page.dart';

void main() {
  runApp(const ProviderScope(child: Myapp()));
}

class Myapp extends ConsumerWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Poem Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
