import 'package:flutter/material.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/screen/forgot_password_screen.dart';
import 'package:pos_app/screen/home/main_home.dart';
import 'package:pos_app/screen/super_admin_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class signinScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      if (await authProvider.login(
          email: email.text, password: password.text)) {
        if (email.text == 'superadmin@gmail.com' && password.text == '1') {
          Navigator.pushReplacementNamed(context, '/admin');
        } else if (email.text == email.text && password.text == password.text) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mainHome();
          }));
        } else {
          throw Exception('Login Gagal');
        }
      }
      // if (await authProvider.login(
      //   email: email.text,
      //   password: password.text,
      // )) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Color(0xFF35A29F),
      //     content: Text(
      //       'Berhasil Login',
      //       textAlign: TextAlign.center,
      //     ),
      //   ));
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => mainHome(),
      //       ));
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Color(0xFFFF6969),
      //     content: Text(
      //       'Gagal Login',
      //       textAlign: TextAlign.center,
      //     ),
      //   ));
      // }
    }

    Widget header() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 66),
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
        margin: EdgeInsets.only(top: 110),
        child: Text(
          'Sign In &\nGrow Your Finance',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 35),
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

    Widget forgotPass() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: 312,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return forgotScreen();
              }));
            },
            child: Text(
              'forgot password',
              style: linkTextStyle,
            ),
          ),
        ),
      );
    }

    Widget signinButton() {
      return Center(
        child: Container(
          height: 50,
          width: 283,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              handleLogin();
            },
            child: Text(
              'Sign In',
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

    Widget createAccount() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 72),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => superAdminScreen()));
            },
            child: Text(
              'Create New Account',
              style: transparantTextStyle.copyWith(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              title(),
              emailInput(),
              passwordInput(),
              forgotPass(),
              signinButton(),
              createAccount()
            ],
          ),
        ),
      ),
    ));
  }
}
