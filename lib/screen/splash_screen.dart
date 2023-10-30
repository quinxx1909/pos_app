import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));
    super.initState();
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
              image: AssetImage('assets/images/logotype.png')
            )
          ),
        ),
      ),
    );
  }
}