import 'package:flutter/material.dart';
import 'package:khongmongkol/screen/home_screen.dart';
import 'package:khongmongkol/welcome_page.dart';
import 'screen/menu_screen.dart';
import 'screen/search_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall1_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall2_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall3_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall4_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall5_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall6_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall7_screen.dart';
import 'package:khongmongkol/screen/wallscreen/wall8_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const WelcomePage(),
      initialRoute: "/",
      routes: {
        "/":(context) => const WelcomePage(),
        "/menu" : (context) => const MenuScreen(),
        "/home" : (context) => const HomeScreen(),
        "/search" :(context) => const SearchScreen(),
        "/wall1_screen": (context) => const Wall1Screen(),
        "/wall2_screen": (context) => const Wall2Screen(),
        "/wall3_screen": (context) => const Wall3Screen(),
        "/wall4_screen": (context) => const Wall4Screen(),
        "/wall5_screen": (context) => const Wall5Screen(),
        "/wall6_screen": (context) => const Wall6Screen(),
        "/wall7_screen": (context) => const Wall7Screen(),
        "/wall8_screen": (context) => const Wall8Screen(),
        },
    );
  }
}
