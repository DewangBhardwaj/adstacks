import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adstacks/app/modules/auth/home/home_screen.dart';
import 'package:adstacks/app/modules/auth/home/general_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/general',
        builder: (context, state) => GeneralScreen(),
      ),
    ],
  );
}
