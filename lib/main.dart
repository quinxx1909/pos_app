import 'package:flutter/material.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => splashscreen(),
        '/sign-in' :(context) => signinScreen(),
      },
    );
  }
}
