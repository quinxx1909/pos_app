import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pos_app/screen/home/cart_screen.dart';
import 'package:pos_app/screen/home/home_screen.dart';
import 'package:pos_app/screen/home/invoice_screen.dart';
import 'package:pos_app/screen/home/product_screen.dart';
import 'package:pos_app/screen/restock/restock_screen.dart';
import 'package:pos_app/theme.dart';

class mainHome extends StatefulWidget {
  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {
  int currentIndex = 0;
  final screens = [
    homeScreen(),
    productScreen(),
    cartScreen(),
    invoiceScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Widget restockButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return restockScreen();
          }));
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icons/restock.png',
          width: 28,
        ),
      );
    }

    Widget customBottomNav() {
      return BottomAppBar(
        color: Colors.amber,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 20,
                ),
                // icon: Icon(Icons.favorite, size: 20,),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/product.png',
                  width: 20,
                ),
                // icon: Icon(Icons.favorite, size: 20, color: Colors.amber,),
                label: 'product'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/cart.png',
                  width: 20,
                ),
                // icon: Icon(Icons.favorite, size: 20,),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/invoice.png',
                  width: 20,
                ),
                // icon: Icon(Icons.favorite, size: 20,),
                label: 'invoice'),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgorundColor3,
      floatingActionButton: restockButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: screens[currentIndex],
    );
  }
}
