import 'package:flutter/material.dart';
import 'package:ies/stu_login.dart';
import 'package:ies/admin_login.dart' ;// Import the Stulogin class from stu_login.dart

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login as'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stulogin()), // Navigate to Stulogin
                );
              },
              child: Text('Login as Student'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPhone()), // Navigate to Stulogin
                );
              },
              child: Text('Login as Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
