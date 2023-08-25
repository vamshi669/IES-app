import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/ieslogo.png",
          width: 200, // Set the width of the logo as per your requirement
          height: 200, // Set the height of the logo as per your requirement
        ),
      ),
    );
  }
}
