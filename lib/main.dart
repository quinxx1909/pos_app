import 'package:flutter/material.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/screen/home/admin_screen.dart';
import 'package:pos_app/screen/home/main_home.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => profilProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => splashscreen(),
          '/sign-in': (context) => signinScreen(),
          '/admin': (context) => AdminScreen(),
          '/home': (context) => mainHome(),
        },
      ),
    );
  }
}
