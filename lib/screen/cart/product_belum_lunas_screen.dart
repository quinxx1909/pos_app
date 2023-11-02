import 'package:flutter/material.dart';
import 'package:pos_app/theme.dart';

class productBelumLunasScreen extends StatefulWidget {
  @override
  State<productBelumLunasScreen> createState() => _productBelumLunasScreenState();
}

class _productBelumLunasScreenState extends State<productBelumLunasScreen> {
  List product = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
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
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 190),
          itemBuilder: (context, index) {
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/cont-produk.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                    width: double.infinity,
                    child: Text(
                      'Converse chuck taylor 70s',
                      style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
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
                          onPressed: () {},
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
                            '43',
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
