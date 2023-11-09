import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_app/model/product_model.dart';
import 'package:pos_app/provider/addproduct_provider.dart';
import 'package:pos_app/provider/addcart_provider.dart';
import 'package:pos_app/provider/product_provider.dart';
// import 'package:pos_app/provider/product_provider.dart';
import 'package:pos_app/screen/home/add_product.dart';
import 'package:pos_app/screen/restock/restock_validator_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class productScreen extends StatefulWidget {
  const productScreen({super.key});

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  late ProductProvider getProduk;

  String dropdownValue = '37';
  final List<String> _dropdownValues = [
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
  ];
  List<bool> _dropdownValue = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    getProduk = Provider.of<ProductProvider>(context, listen: false);
    await getProduk.getproduct();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AddCartProvider cartProvider = Provider.of<AddCartProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // final f1 = context.watch<addProductProvider>().data;
    final f2 = context.watch<ProductProvider>().product;

    // handleAddToCart() async {
    //   bool result = await cartProvider.addToCart(
    //     id_product: 63,
    //     ukuransepatu: '37',
    //   );
    // }

    log('nama : ${f2.data?.first?.nama_product}');
    Widget content() {
      return ListView.builder(
        itemCount: f2.data?.length,
        itemBuilder: (context, index) {
          final item = f2.data?[index];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.white),
            width: double.infinity,
            height: 136,
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://192.168.1.24:8000/gambar/${item?.gambar}'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 16, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${item?.nama_product}',
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle.copyWith(
                              fontWeight: semibold, fontSize: 18),
                        ),
                        Container(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'stok: ${item?.stock}',
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 16),
                              ),
                              Text(
                                'Rp. ${item?.harga}',
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                                  elevation: 0,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  value: dropdownValue,
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 16),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue ?? '';
                                    });
                                  },
                                  items: _dropdownValues
                                      .map((value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ))
                                      .toList(),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool result = await cartProvider.addToCart(
                                    id_product: item!.id!,
                                    ukuransepatu: '37',
                                  );
                                },
                                child: Text(
                                  'add to cart',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 14),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    // Widget restockValidator2() {
    //   return FloatingActionButton(
    //     heroTag: 'restock2',
    //     elevation: 0,
    //     onPressed: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => restockValidatorScreen(),
    //           ));
    //     },
    //     backgroundColor: primaryColor,
    //     child: Image.asset(
    //       'assets/icons/restock-validator.png',
    //       width: 24,
    //     ),
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Product',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return addProductScreen();
                }));
              },
              icon: Image.asset(
                'assets/icons/add-product.png',
                width: 24,
              ),
            )
          ],
        ),
        backgroundColor: backgorundColor3,
        // floatingActionButton: restockValidator2(),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20), child: content())
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   child: Column(
        //       // physics: BouncingScrollPhysics(),
        //       children: [f1.data?.length == 0 ? SizedBox() : content()]),
        // ),
        );
  }
}
