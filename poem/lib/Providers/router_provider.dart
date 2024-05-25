import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem/Providers/Login_provider.dart';
import 'package:poem/providers/states/login_states.dart';
import 'package:poem/screens/about.dart';
import 'package:poem/screens/add_poem.dart';
import 'package:poem/screens/contacts.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/admin_main_page.dart';
import 'package:poem/screens/favorites.dart';
import 'package:poem/screens/poet_poem.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/screens/user_screen.dart';
import 'package:poem/screens/user_poem.dart';
import 'package:poem/screens/welcome_page.dart';
import '../screens/user_favorite.dart';
import '../Providers/Login_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router._routes,
    redirect: (context, state) => router._redirectLogic(state),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(GoRouterState state){
    final loginState = _ref.read(loginControllerProvider);
    final areWeLoggingIn = state.namedLocation == '/login';
    if (loginState is LoginStateSuccess){
      return areWeLoggingIn ? null : '/login';
    }

    if (areWeLoggingIn){
      return '/';
    }

    return null;
  }


  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (context, state) => const Welcome(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/signUp',
          builder: (context, state) => const SignUp(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const About(),
        ),
        GoRoute(
          path: '/addPoem',
          builder: (context, state) => AddPoemDialog(
            onSave: (title, author, genre, content) {
              print('Title: $title, Author: $author, Genre: $genre, Content: $content');
            },
          ),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const Contact(),
        ),
        GoRoute(
          path: '/adminFavorites',
          builder: (context, state) => const MyFavoritesScreen(favoritePoems: []),
        ),
        GoRoute(
          path: '/PoemListScreen',
          builder: (context, state) => const PoemListScreen(),
        ),
        GoRoute(
          path: '/userFavorite',
          builder: (context, state) => const UserFavorites(),
        ),
        GoRoute(
          path: '/userPoemList',
          builder: (context, state) => const UserPoemListScreen(),
        ),
        GoRoute(
          path: '/userApp',
          builder: (context, state) => UserApp(),
        ),
      ];
}
