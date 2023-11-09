import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_app/provider/cart_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class productCartScreen extends StatefulWidget {
  @override
  State<productCartScreen> createState() => _productCartScreenState();
}

class _productCartScreenState extends State<productCartScreen> {
  late CartProvider getCart;

  List product = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    getCart = Provider.of<CartProvider>(context, listen: false);
    await getCart.getcart();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final f1 = context.watch<CartProvider>().cart;

    Future printButton() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actionsPadding:
              EdgeInsets.only(left: 20, right: 20, top: 34, bottom: 34),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukkan nama pelanggan',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: 282,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: '', hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 40,
                width: 140,
                margin: EdgeInsets.only(left: 12, right: 12, top: 48),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'continue',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            )
          ],
        ),
      );
    }

    log('nama : ${f1.data?.first?.nama}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Product Cart',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        actions: [
          IconButton(
            onPressed: () {
              printButton();
            },
            icon: Image.asset(
              'assets/icons/atm.png',
              width: 24,
            ),
          )
        ],
      ),
      backgroundColor: backgorundColor3,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: f1.data?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 190),
          itemBuilder: (context, index) {
            final item = f1.data?[index];
            return Container(
              height: 176,
              width: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://192.168.1.24:8000/gambar/${item?.gambar}'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                    width: double.infinity,
                    child: Text(
                      '${item?.nama}',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: TextButton(
                          onPressed: () {
                            CartProvider().deleteCart(id: item!.id!);
                            setState(() {
                              getInit();
                            });
                          },
                          child: Text(
                            'Delete',
                            style: secondaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 12),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: cancelColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10),
                        height: 30,
                        child: Center(
                          child: Text(
                            '${item?.ukuransepatu}',
                            style: primaryTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
