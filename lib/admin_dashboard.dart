import 'package:flutter/material.dart';
import 'package:ies/student_dashboard.dart'; // Import the StudentDashboard
import 'package:ies/admin_dashboard.dart'; // Import the AdminDashboard

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Text('Welcome, Admin!'),
      ),
    );
  }
}
