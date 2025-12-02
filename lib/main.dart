import 'package:flutter/material.dart';
import 'package:tiktok_challenge/screens/sign_up/sign_up_screen.dart';

void main() {
  runApp(TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Twitter App",
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 29, 161, 242),
        highlightColor: Color.fromARGB(255, 108, 173, 222),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignUpScreen(),
    );
  }
}
