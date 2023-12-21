import 'package:flutter/material.dart';
//import 'package:kot/tables/ui/tables.dart';
import 'login/login-page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: const Image(
          image: AssetImage('images/vinsup logo.png'),
        ),
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: waiter(),
      ),
    );
  }
}
