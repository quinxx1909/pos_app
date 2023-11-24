import 'package:flutter/material.dart';
import 'package:pos_app/provider/uang_keluar_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class uangKeluarScreen extends StatefulWidget {
  const uangKeluarScreen({super.key});

  @override
  State<uangKeluarScreen> createState() => _uangKeluarScreenState();
}

class _uangKeluarScreenState extends State<uangKeluarScreen> {
  late UangKeluarProvider getUang;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    getUang = Provider.of<UangKeluarProvider>(context, listen: false);
    await getUang.getUangKeluar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final f1 = context.watch<UangKeluarProvider>().uang;

    Widget content() {
      return ListView.builder(
        itemCount: f1.data?.length,
        itemBuilder: (context, index) {
          final uang = f1.data?[index];
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
                    '${uang?.tanggal_pengeluaran}',
                    style: primaryTextStyle,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/uang-keluar.png',
                        width: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${uang?.note}',
                        style: primaryTextStyle,
                      ),
                      Spacer(),
                      Text(
                        '- Rp. ${uang?.nominal}',
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
