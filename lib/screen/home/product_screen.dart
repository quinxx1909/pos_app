import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class productScreen extends StatefulWidget {
  const productScreen({super.key});

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  String dropdownValue = '37';
  final List<String> _dropdownValues = [
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
  ];

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.white),
        width: double.infinity,
        height: 136,
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cont-produk.png'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 16, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Converse chuck taylor 70s',
                      overflow: TextOverflow.ellipsis,
                      style: primaryTextStyle.copyWith(
                          fontWeight: semibold, fontSize: 18),
                    ),
                    Container(
                      width: 170,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'stok: 77',
                            overflow: TextOverflow.ellipsis,
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 16),
                          ),
                          Text(
                            'Rp. 780.000',
                            overflow: TextOverflow.ellipsis,
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              elevation: 0,
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              value: dropdownValue,
                              style: primaryTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: _dropdownValues
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'add to cart',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 14),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget restockValidator2() {
      return FloatingActionButton(
        heroTag: 'restock2',
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Product',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/add-product.png',
              width: 24,
            ),
          )
        ],
      ),
      backgroundColor: backgorundColor3,
      floatingActionButton: restockValidator2(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            content(),
            content(),
            content(),
            content(),
            content(),
            content(),
            content(),
            content(),
          ],
        ),
      ),
    );
  }
}
