import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adstacks/app/modules/auth/home/home_screen.dart';  // Make sure to import the general screen
import 'package:adstacks/app/modules/auth/home/general_screen.dart';  // Import the home screen


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
    initialLocation: '/home', // Set initial route
    routes: [
      // Define home screen route
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      // Define general screen route
      GoRoute(
        path: '/general',
        builder: (context, state) => GeneralScreen(),
      ),
    ],
  );
}



// import 'package:adstacks/app/modules/auth/home/home_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AdStacks',
//       theme: ThemeData(
        
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
