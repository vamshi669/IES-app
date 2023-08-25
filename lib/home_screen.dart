import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat_screen.dart'; // Import the ChatScreen class
import 'scholarship_form.dart';
import 'editprofile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    _buildHomeContent(),
    ScholarshipForm(),
    ChatScreen(),
  ];

  final List<Tab> _tabs = [
    Tab(text: 'News Feed'),
    Tab(text: 'Colleges'),
  ];

  static Widget _buildHomeContent() {
    return TabBarView(
      children: <Widget>[
        Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Placeholder for the "Colleges" tab content
        Center(child: Text("Colleges Tab Content")),
      ],
    );
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfile()), // Navigate to EditProfile
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                title: const Text("IES"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: _navigateToEditProfile,
                  ),
                ],
                bottom: TabBar(
                  tabs: _tabs,
                ),
              )
            : null,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Edit Profile'),
                      onTap: _navigateToEditProfile, // Use the function to navigate
                    ),

                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Application Status'),
                      onTap: () {
                        // Add the change password action here
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About Us'),
                      onTap: () {
                        // Add the about us action here
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.description),
                      title: Text('Terms of Use'),
                      onTap: () {
                        // Add the terms of use action here
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text('Privacy Policy'),
                      onTap: () async {
                        const url = 'https://www.iesonline.co.in/privacy-policy#:~:text=When%20you%20voluntarily%20send%20us,mail%20address%20or%20phone%20number.';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // Handle the case if the URL can't be launched.
                          // For example, you can show an error message.
                          print('Could not launch $url');
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.question_answer),
                      title: Text('FAQs'),
                      onTap: () async {
                        const url = 'https://www.iesonline.co.in/faq';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // Handle the case if the URL can't be launched.
                          // For example, you can show an error message.
                          print('Could not launch $url');
                        }
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text('Contact Us'),
                      onTap: () async {
                        const url = 'https://www.iesonline.co.in/contact-us.php';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // Handle the case if the URL can't be launched.
                          // For example, you can show an error message.
                          print('Could not launch $url');
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                // Add the logout action here
              },
            ),
          ],
        ),
      ),
        ),
    );
  }
}
