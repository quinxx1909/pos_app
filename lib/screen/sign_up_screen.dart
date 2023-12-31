import 'package:flutter/material.dart';
import 'package:pos_app/model/auth_model.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/screen/super_admin_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class signupScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      bool result = await authProvider.register(
        name: name.text,
        email: email.text,
        password: password.text,
        is_superadmin: "admin",
      );
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF35A29F),
          content: Text(
            'Register Berhasil',
            textAlign: TextAlign.center,
          ),
        ));
      }
    }

    Widget header() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          height: 92,
          width: 241,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logotype black.png'))),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 59),
        child: Text(
          'Join Us to Unlock\nYour Growth',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 52),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: name,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: email,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signupButton() {
      return Center(
        child: Container(
          height: 50,
          width: 283,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              handleSignUp();
            },
            child: Text(
              'Sign Up',
              style: secondaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: 16),
            ),
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
      );
    }

    Widget signIn() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 72),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => signinScreen()));
            },
            child: Text(
              'Sign In',
              style: transparantTextStyle.copyWith(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  title(),
                  nameInput(),
                  emailInput(),
                  passwordInput(),
                  signupButton(),
                  signIn()
                ],
              ),
            ),
          ),
        ));
  }
}
