import 'package:flutter/material.dart';
import 'package:pos_app/provider/restock_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class restockValidatorScreen extends StatefulWidget {
  const restockValidatorScreen({super.key});

  @override
  State<restockValidatorScreen> createState() => _restockValidatorScreenState();
}

class _restockValidatorScreenState extends State<restockValidatorScreen> {
  late RestockProvider getRestock;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  void getInit() async {
    getRestock = Provider.of<RestockProvider>(context, listen: false);
    var restock = await getRestock.getRestock();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final f = context.watch<RestockProvider>().restock;

    Widget content() {
      return ListView.builder(
        itemCount: f.data?.length,
        itemBuilder: (context, index) {
          final item = f.data?[index];
          return Container(
            margin: EdgeInsets.only(top: 10),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: primaryColor),
            child: Container(
              margin: EdgeInsets.only(top: 12, left: 14, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '${item?.nama_product}',
                          style: secondaryTextStyle.copyWith(
                              fontWeight: semibold, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          '${item?.tanggal_pemesanan}',
                          style: secondaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
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
                                    style: secondaryTextStyle.copyWith(
                                        fontWeight: medium, fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    ': ${item?.size}\n: ${item?.qty}\n: ${item?.purchase_id}',
                                    style: secondaryTextStyle.copyWith(
                                        fontWeight: medium, fontSize: 14),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        'total  : ${item?.harga}',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                            onPressed: () {
                              RestockProvider().deleteRestock(id: item!.id!);
                              setState(() {
                                getInit();
                              });
                            },
                            style: TextButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                backgroundColor: cancelColor),
                            child: Text(
                              'cancel',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 66,
                          child: TextButton(
                            onPressed: () async {
                              bool result =
                                  await RestockProvider().checkRestock(
                                id: item!.id!,
                                id_product: item.id_product!,
                                qty: item.qty!,
                                note: '',
                                size: item.size!,
                                status: '',
                              );
                              setState(() {
                                getInit();
                              });
                            },
                            style: TextButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                backgroundColor: Colors.white),
                            child: Text(
                              'accept',
                              style: primaryTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 12),
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
        },
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
          child: content(),
        ),
      ),
    );
  }
}
