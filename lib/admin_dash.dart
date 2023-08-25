import 'package:flutter/material.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    _buildChatContent(),
    _buildEducationContent(),
  ];

  static Widget _buildChatContent() {
    return const Placeholder(); // Replace with your Chat content
  }

  static Widget _buildEducationContent() {
    return const Placeholder(); // Replace with your Education content
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Set the app bar color to green
        title: Text(
          "Admin Dashboard",
          style: TextStyle(color: Colors.white), // Set the title text color to white
        ),
        centerTitle: true, // Center the title
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Scholarship',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Education',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Change the color to green
              ),
              child: Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              onTap: () {
                // Add your edit profile navigation here
              },
            ),
            // Add other drawer items here
          ],
        ),
      ),
    );
  }
}
