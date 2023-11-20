import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_app/provider/product_belum_lunas_provider.dart';
import 'package:pos_app/provider/product_sudah_lunas_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class productBelumLunasScreen extends StatefulWidget {
  @override
  State<productBelumLunasScreen> createState() =>
      _productBelumLunasScreenState();
}

class _productBelumLunasScreenState extends State<productBelumLunasScreen> {
  late ProductBelumLunasProvider getdata;

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
    getdata = Provider.of<ProductBelumLunasProvider>(context, listen: false);
    await getdata.getProduk();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final f1 = context.watch<ProductBelumLunasProvider>().add;

    log('Nama : ${f1.data?.length}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Product Belum Lunas',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
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
                                'http://192.168.1.25:8000/gambar/${item?.gambar}'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                    width: double.infinity,
                    child: Text(
                      '${item?.namaProduct}',
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
                          onPressed: () async {
                            bool result =
                                await ProductSudahLunasProvider().addLunas(
                              order_id: item!.orderId!,
                            );
                          },
                          child: Text(
                            'Lunas',
                            style: secondaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 12),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: lunasColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10),
                        height: 30,
                        child: Center(
                          child: Text(
                            '${item?.size}',
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
