import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khongmongkol/screen/home_screen.dart'; // Ensure this import is correct

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()));
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome.png'), // Image for the body
            fit: BoxFit.cover, // Makes the image cover the entire container
          ),
        ),
      ),
    );
  }
}