import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => signinScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Admin',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Image.asset(
                'assets/icons/logout.png',
                width: 18,
              ))
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Halaman Admin'),
        ),
      ),
    );
  }
}
