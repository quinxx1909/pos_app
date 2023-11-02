import 'package:flutter/material.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/screen/super_admin_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class forgotScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleForgot() async {
      bool result = await authProvider.forgotpassword(
        email: email.text,
        password: password.text,
      );
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF35A29F),
          content: Text(
            'Berhasil Ubah Password',
            textAlign: TextAlign.center,
          ),
        ));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => forgotScreen(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFFFF6969),
          content: Text(
            'Gagal Mengubah Password',
            textAlign: TextAlign.center,
          ),
        ));
      }
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
          'Enter Your Email &\nNew Password',
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
                'New Password',
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
                          hintText: 'New Password',
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

    Widget forgotButton() {
      return Center(
        child: Container(
          height: 50,
          width: 283,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: () {
              handleForgot();
            },
            child: Text(
              'Reset',
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
              forgotButton(),
              signIn(),
            ],
          ),
        ),
      ),
    ));
  }
}
