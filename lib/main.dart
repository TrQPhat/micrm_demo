import 'package:flutter/material.dart';
import 'package:micrm_demo/screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A1172),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ContactScreen(),
    );
  }
}
