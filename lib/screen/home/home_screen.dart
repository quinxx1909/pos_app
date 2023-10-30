import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
                    style: otherTextStyle.copyWith(fontSize: 16, fontWeight: regular),
                  ),
                  Text(
                    'VINKCY FIRMAN PRATAMA',
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
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
                SizedBox(width: 18,),
                Center(
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/icons/logout.png',
                      width: 18,
                    ),
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
          image: DecorationImage(image: AssetImage('assets/images/bg wallet.png'),fit: BoxFit.cover)
        ),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bit Wallet',
                style: secondaryTextStyle.copyWith(fontSize: 22, fontWeight: medium),
              ),
              SizedBox(height: 20,),
              Text(
                'Balance',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                'Rp. 59.000.000',
                style: secondaryTextStyle.copyWith(fontWeight: semibold, fontSize: 28),
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
          borderRadius: BorderRadius.circular(14),
          color: Colors.white
        ),
        padding: EdgeInsets.only(left: 17, top: 27, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/transaksi-masuk.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 5,),
            Row(
              children: [
                Image.asset('assets/icons/transaksi-masuk.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 5,),
            Row(
              children: [
                Image.asset('assets/icons/transaksi-masuk.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 15,),
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
          borderRadius: BorderRadius.circular(14),
          color: Colors.white
        ),
        padding: EdgeInsets.only(left: 17, top: 27, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/transaksi-keluar.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 5,),
            Row(
              children: [
                Image.asset('assets/icons/transaksi-keluar.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 5,),
            Row(
              children: [
                Image.asset('assets/icons/transaksi-keluar.png', width: 30,),
                SizedBox(width: 9,),
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
            SizedBox(height: 15,),
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
    
    Widget restockValidator() {
      return FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Image.asset('assets/icons/restock-validator.png', width: 24,),
      );
    }
    
    return Scaffold(
      backgroundColor: backgorundColor3,
      floatingActionButton: restockValidator(),
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
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}