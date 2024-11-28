import 'package:app_2/contact_page.dart';
import 'package:app_2/data_page.dart';
import 'package:app_2/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white))),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List _screens = [
    HomePage(),
    DataPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter App')),
        body: _screens[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (pageIndex) {
            setState(() {
              _currentIndex = pageIndex;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.data_usage),
              label: 'Data',
            ),
            NavigationDestination(
              icon: Icon(Icons.android),
              label: 'Contact',
            )
          ],
        ));
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });
}
