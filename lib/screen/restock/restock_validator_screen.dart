import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class restockValidatorScreen extends StatelessWidget {
  const restockValidatorScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: primaryColor
        ),
        child: Container(
          margin: EdgeInsets.only(top: 12, left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      'Converse chuck taylor 70s',
                      style: secondaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      '27/11/2023',
                      style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'size\nquantity\nkode pemesanan',
                                style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              child: Text(
                                ': 37\n: 7\n: 7200',
                                style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'total  : 9.270.000',
                    style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(''),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 66,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          backgroundColor: cancelColor
                        ),
                        child: Text(
                          'cancel',
                          style: secondaryTextStyle.copyWith(fontWeight: medium, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 30,
                      width: 66,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          backgroundColor: Colors.white
                        ),
                        child: Text(
                          'accept',
                          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Restock Validator',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              content(),
              content(),
              content(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}