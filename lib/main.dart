import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(const NameCardApp());
}

class NameCardApp extends StatelessWidget {
  const NameCardApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Name Card',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
