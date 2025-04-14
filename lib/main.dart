import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micrm_demo/screens/contact_screen.dart';
import 'package:micrm_demo/screens/search_screen.dart'; // Giả sử bạn có màn hình search

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF0A1172), // Màu nền thanh trạng thái
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiCRM',

      theme: ThemeData(primaryColor: Color(0xFF0A1172)),

      debugShowCheckedModeBanner: false,
      home: const MainWrapper(),
      routes: {
        '/search': (context) => const SearchScreen(),
        // ... các route khác nếu có
      },
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    const Placeholder(),
    const ContactScreen(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0A1172),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Contact',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Account'),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: 'Deals',
          ),
        ],
      ),
    );
  }
}
