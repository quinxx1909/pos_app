import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class uangKeluarScreen extends StatelessWidget {
  const uangKeluarScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Widget content() {
      return Container(
        height: 70,
        decoration: BoxDecoration(
          color: backgorundColor2,
          borderRadius: BorderRadius.circular(14)
        ),
        margin: EdgeInsets.only(top: 10),
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 8, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2023/11/27',
                style: primaryTextStyle,
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/uang-keluar.png',
                    width: 22,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'restock',
                    style: primaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    '- Rp. 2.500.000',
                    style: primaryTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 14),
      child: ListView(
        children: [
          content(),
          content(),
          content(),
          content(),
          content(),
        ],
      ),
    );
  }
}