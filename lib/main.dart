import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the SplashScreen class
import 'login_screen.dart'; // Import the LoginScreen class
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: SplashScreen(), // Use SplashScreen as the initial route
      routes: {
        '/login': (context) => LoginScreen(), // Named route for LoginScreen
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate loading necessary resources here (e.g., initializing Firebase)
    // For demonstration purposes, let's wait for 2 seconds using Future.delayed
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)), // Simulate a 2-second delay
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the delay, show the splash screen
          return Scaffold(
            body: Center(
              child: Image.asset(
                "assets/ieslogo.png",
                width: 200, // Set the width of the logo as per your requirement
                height: 200, // Set the height of the logo as per your requirement
              ),
            ),
          );
        } else {
          // After the delay, navigate to the login screen
          return LoginScreen();
        }
      },
    );
  }
}
