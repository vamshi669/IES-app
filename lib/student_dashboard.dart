import 'package:flutter/material.dart';


class Studentinterface extends StatefulWidget {
  const Studentinterface({Key? key}) : super(key: key);

  @override
  State<Studentinterface> createState() => _StudentinterfaceState();
}

class _StudentinterfaceState extends State<Studentinterface> {
  int _currentIndex = 0; // To track the current tab index

  // Define your pages/screens here, you can replace Placeholder() with your actual widgets
  final List<Widget> _pages = [
    Placeholder(), // News Feed
    Placeholder(), // Education Bar
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Interface'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add your navigation logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your navigation logic here
            },
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the selected tab
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'News Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Education Bar',
          ),
        ],
      ),
    );
  }
}
