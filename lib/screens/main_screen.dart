import 'package:flutter/material.dart';

//Screens
import 'landing_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LandingScreen(),
    );
  }
}
