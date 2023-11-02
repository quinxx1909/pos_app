import 'package:flutter/material.dart';
import 'package:pos_app/screen/tabs/uang_keluar_screen.dart';
import 'package:pos_app/screen/tabs/uang_masuk_screen.dart';
import 'package:pos_app/screen/restock/restock_validator_screen.dart';
import 'package:pos_app/theme.dart';

class invoiceScreen extends StatefulWidget {
  const invoiceScreen({super.key});

  @override
  State<invoiceScreen> createState() => _invoiceScreenState();
}

class _invoiceScreenState extends State<invoiceScreen> {
  List<String> items = [
    'uang masuk',
    'uang keluar',
  ];

  @override
  Widget build(BuildContext context) {
    Widget restockValidator4() {
      return FloatingActionButton(
        heroTag: 'restock4',
        elevation: 0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => restockValidatorScreen(),));
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icons/restock-validator.png',
          width: 24,
        ),
      );
    }

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
              'Invoice',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
          floatingActionButton: restockValidator4(),
          body: Column(
            children: [
              TabBar(
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor
                ),
                labelStyle: secondaryTextStyle.copyWith(fontWeight: medium),
                unselectedLabelColor: Colors.black,
                labelColor: textColor,
                tabs: [
                  Tab(
                    icon: Text('      uang masuk      '),
                  ),
                  Tab(
                    icon: Text('      uang keluar      '),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    uangMasukScreen(),
                    uangKeluarScreen(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
