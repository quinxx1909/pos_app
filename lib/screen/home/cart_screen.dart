import 'package:flutter/material.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/screen/cart/product_belum_lunas_screen.dart';
import 'package:pos_app/screen/cart/product_cart_screen.dart';
import 'package:pos_app/screen/cart/product_sudah_lunas_screen.dart';
import 'package:pos_app/screen/home/add_customer.dart';
import 'package:pos_app/screen/restock/restock_validator_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
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
    Widget titleWallet() {
      return Container(
        margin: EdgeInsets.only(top: 17),
        child: Text(
          'Bit Wallet',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
      );
    }

    Widget walletCard() {
      return Container(
          height: 55,
          width: 80,
          margin: EdgeInsets.only(top: 2),
          child: Row(
            children: [
              Image.asset('assets/images/card.png'),
              SizedBox(
                width: 16,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getprofil.profil.data?.name}',
                      style: primaryTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      'my card',
                      style: transparantTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ));
    }

    Widget titleMenu() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Menu',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
      );
    }

    Widget AddCustomer() {
      return FloatingActionButton(
        heroTag: 'restock3',
        elevation: 0,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCustomerScreen(),
              ));
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icons/add.png',
          width: 24,
          color: Colors.white,
        ),
      );
    }

    Widget menuContent() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pruduct-cart.jpg',
                        width: 98,
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Product cart',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semibold),
                          ),
                          Text(
                            'lihat produkmu di keranjang ini',
                            style: transparantTextStyle.copyWith(
                                fontWeight: medium, fontSize: 10),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            margin: EdgeInsets.only(top: 22),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => productCartScreen(),
                                    ));
                              },
                              child: Text(
                                'see more',
                                style: secondaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 10),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/product-belum-lunas.jpg',
                        width: 98,
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Product belum lunas',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semibold),
                          ),
                          Text(
                            'lihat produkmu yang belum lunas disini',
                            style: transparantTextStyle.copyWith(
                                fontWeight: medium, fontSize: 10),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            margin: EdgeInsets.only(top: 22),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          productBelumLunasScreen(),
                                    ));
                              },
                              child: Text(
                                'see more',
                                style: secondaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 10),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/product-sudah-lunas.jpg',
                        width: 90,
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Product sudah lunas',
                            style:
                                primaryTextStyle.copyWith(fontWeight: semibold),
                          ),
                          Text(
                            'lihat produkmu yang sudah lunas disini',
                            style: transparantTextStyle.copyWith(
                                fontWeight: medium, fontSize: 10),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            margin: EdgeInsets.only(top: 22),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          productSudahLunasScreen(),
                                    ));
                              },
                              child: Text(
                                'see more',
                                style: secondaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 10),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            'Cart',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
        floatingActionButton: AddCustomer(),
        backgroundColor: backgorundColor3,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                titleWallet(),
                walletCard(),
                titleMenu(),
                menuContent()
              ],
            ),
          ),
        ));
  }
}
