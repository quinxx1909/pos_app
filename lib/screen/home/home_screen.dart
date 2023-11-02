import 'package:flutter/material.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late profilProvider getprofil;

  @override
  void initState() {
    // TODO: implement initState
    getProfile();
    super.initState();
  }

  void getProfile() async {
    getprofil = Provider.of<profilProvider>(context, listen: false);
    getprofil.profil = await getprofil.getProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void logout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => signinScreen()));
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        height: 60,
        width: 343,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo',
                    style: otherTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular),
                  ),
                  Text(
                    '${getprofil.profil.data?.name}',
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: semibold),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/user.png',
                  width: 50,
                ),
                SizedBox(
                  width: 18,
                ),
                Center(
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/icons/logout.png',
                      width: 18,
                    ),
                    onTap: () {
                      logout();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget walletCard() {
      return Container(
        height: 160,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
                image: AssetImage('assets/images/bg wallet.png'),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bit Wallet',
                style: secondaryTextStyle.copyWith(
                    fontSize: 22, fontWeight: medium),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Balance',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                'Rp. 59.000.000',
                style: secondaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 28),
              )
            ],
          ),
        ),
      );
    }

    Widget titleUangMasuk() {
      return Container(
        margin: EdgeInsets.only(top: 22),
        child: Text(
          'Uang Masuk',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
        ),
      );
    }

    Widget uangMasuk() {
      return Container(
        width: double.infinity,
        height: 177,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.white),
        padding: EdgeInsets.only(left: 17, top: 27, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-masuk.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '+Rp. 3.500.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-masuk.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '+Rp. 3.500.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-masuk.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '+Rp. 3.500.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'lihat semua transaksi',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    Widget titleUangKeluar() {
      return Container(
        margin: EdgeInsets.only(top: 22),
        child: Text(
          'Uang Keluar',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
        ),
      );
    }

    Widget uangKeluar() {
      return Container(
        width: double.infinity,
        height: 177,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.white),
        padding: EdgeInsets.only(left: 17, top: 27, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-keluar.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '-Rp. 1.250.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-keluar.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '-Rp. 1.250.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/transaksi-keluar.png',
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '2023/09/11',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                Spacer(),
                Text(
                  '-Rp. 1.250.000',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'lihat semua transaksi',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    Widget restockValidatorHome() {
      return FloatingActionButton(
        heroTag: 'restockhome',
        elevation: 0,
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icons/restock-validator.png',
          width: 24,
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgorundColor3,
        floatingActionButton: restockValidatorHome(),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                header(),
                walletCard(),
                titleUangMasuk(),
                uangMasuk(),
                titleUangKeluar(),
                uangKeluar(),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ));
  }
}
