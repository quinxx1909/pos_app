import 'package:flutter/material.dart';
import 'package:pos_app/screen/sign_up_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class superAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _openWA() async {
      String phone = '6285216891903';
      var url = 'https://wa.me/6285216891903?text=Hello superAdmin, saya sudah register di *Bit Wallet*. Mohon untuk di proses akun saya';
      await launch(url);
    }

    Widget header() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          height: 92,
          width: 241,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logotype.png'))),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 110),
        child: Text(
          'Setelah register, silahkan\nhubungi superAdmin melalui\nwhatsapp\n\n\n...',
          style: secondaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget whatsappButton() {
      return Container(
        height: 44,
        width: 168,
        margin: EdgeInsets.only(top: 118),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 1, color: textColor)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 19),
              child: Center(
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    _openWA();
                  },
                  icon: Image.asset('assets/icons/whatsapp.png', height: 24,),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _openWA();
              },
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                'click here',
                style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
            )
          ],
        ),
      );
    }

    Widget nextSlide() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => signupScreen()));
          },
          child: Text(
            'klik disini untuk ke halaman register',
          style: secondaryTextStyle,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: backgorundColor,
        body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                header(),
                title(),
                whatsappButton(),
                nextSlide()
              ],
            ),
          ),
        ),
    ));
  }
}
