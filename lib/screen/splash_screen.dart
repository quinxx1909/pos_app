import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_app/screen/home/admin_screen.dart';
import 'package:pos_app/screen/home/main_home.dart';
import 'package:pos_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    openSplashScreen();
    super.initState();
  }

  openSplashScreen() async {
    var prefs = await SharedPreferences.getInstance();
    var durasiSplash = const Duration(seconds: 3);
    return Timer(
      durasiSplash,
      () {
        String? token = prefs.getString("token");
        log("token : $token");
        if (token != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return mainHome();
          }));
        } else {
          Navigator.pushNamed(context, '/sign-in');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgorundColor,
      body: Center(
        child: Container(
          height: 92,
          width: 241,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logotype.png'))),
        ),
      ),
    );
  }
}
