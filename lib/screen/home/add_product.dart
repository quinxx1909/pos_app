import 'dart:developer';
import 'dart:io';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/provider/addproduct_provider.dart';
import 'package:pos_app/screen/home/product_screen.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class addProductScreen extends StatefulWidget {
  @override
  State<addProductScreen> createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen> {
  TextEditingController nama = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController harga = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? gambar;

  Future getImage() async {
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    gambar = File(imagePicked!.path);
    setState(() {});
  }

  List<String> sizeList = [
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
  ];
  List<bool> sizeListValue = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Widget sizeItem() {
    return Wrap(
      children: List.generate(
        sizeList.length,
        (index) {
          final itemValue = sizeListValue[index];
          return InkWell(
            onTap: () {
              setState(() {
                sizeListValue[index] = !sizeListValue[index];
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: itemValue ? primaryColor : Colors.white,
                border:
                    Border.all(color: itemValue ? primaryColor : Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                  color: itemValue ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    addProductProvider addProduct = Provider.of<addProductProvider>(context);

    handleAddProduct() async {
      List<String> size = [];
      for (var i = 0; i < sizeList.length; i++) {
        if (sizeListValue[i]) {
          size.add(sizeList[i]);
        }
      }
      bool result = await addProduct.addProduct(
        nama_product: nama.text,
        harga: double.parse(harga.text.toString()),
        stok: stok.text.toString(),
        size: size,
        gambar: gambar!,
      );
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF35A29F),
          content: Text(
            'Add Product Berhasil',
            textAlign: TextAlign.center,
          ),
        ));
        Navigator.pushNamed(context, '/product');
      }
    }

    Widget productPict() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        width: double.infinity,
        height: 127,
        child: Row(
          children: [
            gambar != null
                ? Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 14),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(gambar!.path),
                        fit: BoxFit.cover,
                        width: 189,
                        height: double.infinity,
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 14, bottom: 14),
                    width: 189,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'No Image',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                  ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 18),
              child: GestureDetector(
                onTap: () async {
                  await getImage();
                },
                child: Row(
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          'assets/icons/gallery black.png',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'add photo',
                      style: primaryTextStyle,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget inputNamaProduct() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        width: double.infinity,
        height: 78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Product',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1)),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: TextFormField(
                    controller: nama,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: 'your product name',
                        hintStyle: transparantTextStyle),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget inputSize() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                // width: double.infinity,
                child: sizeItem(),
                // child: Center(
                //   child: CustomCheckBoxGroup(
                //     unSelectedColor: Colors.white,
                //     selectedBorderColor: primaryColor,
                //     unSelectedBorderColor: Colors.black,
                //     buttonTextStyle: ButtonTextStyle(
                //         selectedColor: textColor,
                //         unSelectedColor: Colors.black,
                //         textStyle: primaryTextStyle.copyWith(fontSize: 14)),
                //     enableShape: true,
                //     shapeRadius: 6,
                //     elevation: 0,
                //     height: 26,
                //     width: 50,
                //     buttonLables: [
                //       "37",
                //       "38",
                //       "39",
                //       "40",
                //       "41",
                //       "42",
                //       "43",
                //       "44",
                //     ],
                //     buttonValuesList: [
                //       "37",
                //       "38",
                //       "39",
                //       "40",
                //       "41",
                //       "42",
                //       "43",
                //       "44",
                //     ],
                //     checkBoxButtonValues: (value) => log("value ${value}"),
                //     selectedColor: primaryColor,
                //     defaultSelected: ['37'],
                //   ),
                // ),
              )
            ],
          ),
        ),
      );
    }

    Widget inputQuantity() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
            Container(
              height: 45,
              width: 60,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1)),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: TextFormField(
                    controller: stok,
                    keyboardType: TextInputType.number,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: '0', hintStyle: transparantTextStyle),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget inputPrice() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text(
                      'Rp. ',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 45,
                  width: 230,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 1)),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: TextFormField(
                        controller: harga,
                        keyboardType: TextInputType.number,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: '', hintStyle: transparantTextStyle),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget addProductButton() {
      return Center(
        child: Container(
          height: 50,
          width: 283,
          margin: EdgeInsets.only(top: 127),
          child: TextButton(
            onPressed: () {
              handleAddProduct();
            },
            child: Text(
              'Add Product',
              style: secondaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: 16),
            ),
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Add Product',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
        backgroundColor: backgorundColor3,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                productPict(),
                inputNamaProduct(),
                inputSize(),
                inputQuantity(),
                inputPrice(),
                addProductButton()
              ],
            ),
          ),
        ));
  }
}
