import 'package:flutter/material.dart';
import 'package:pos_app/screen/tabs/product_belum_lunas_screen.dart';
import 'package:pos_app/screen/tabs/product_sudah_lunas_screen.dart';
import 'package:pos_app/theme.dart';

class transactionScreen extends StatefulWidget {
  @override
  State<transactionScreen> createState() => _transactionScreenState();
}

class _transactionScreenState extends State<transactionScreen> {
  List<String> items = [
    'belum Lunas',
    'sudah lunas',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              'Transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
          // floatingActionButton: restockValidator4(),
          body: Column(
            children: [
              TabBar(
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryColor),
                labelStyle: secondaryTextStyle.copyWith(fontWeight: medium),
                unselectedLabelColor: Colors.black,
                labelColor: textColor,
                tabs: [
                  Tab(
                    icon: Text('      belum lunas      '),
                  ),
                  Tab(
                    icon: Text('      sudah lunas      '),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    productBelumLunasScreen(),
                    productSudahLunasScreen(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}