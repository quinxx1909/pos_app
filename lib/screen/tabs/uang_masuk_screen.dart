import 'package:flutter/material.dart';
import 'package:pos_app/provider/uang_masuk_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class uangMasukScreen extends StatefulWidget {
  const uangMasukScreen({super.key});

  @override
  State<uangMasukScreen> createState() => _uangMasukScreenState();
}

class _uangMasukScreenState extends State<uangMasukScreen> {
  late UangMasukProvider getUangMasuk;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    getUangMasuk = Provider.of<UangMasukProvider>(context, listen: false);
    await getUangMasuk.getUangMasuk();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final f1 = context.watch<UangMasukProvider>().uang;

    Widget content() {
      return ListView.builder(
        itemCount: f1.data?.length,
        itemBuilder: (context, index) {
          final item = f1.data?[index];
          return Container(
            height: 70,
            decoration: BoxDecoration(
                color: backgorundColor2,
                borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.only(top: 10),
            child: Container(
              margin: EdgeInsets.only(left: 15, top: 8, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item?.tanggal_pemasukan}',
                    style: primaryTextStyle,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/uang-masuk.png',
                        width: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${item?.note}',
                        style: primaryTextStyle,
                      ),
                      Spacer(),
                      Text(
                        '+ Rp. ${item?.nominal}',
                        style: primaryTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 14),
      child: f1.data?.length == 0 ? SizedBox() : content(),
    );
  }
}
