import 'dart:convert';
import 'dart:developer';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/provider/product_provider.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/provider/restock_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class restockScreen extends StatefulWidget {
  const restockScreen({super.key});

  @override
  State<restockScreen> createState() => _restockScreenState();
}

class _restockScreenState extends State<restockScreen> {
  TextEditingController tanggal = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController size = TextEditingController();
  late profilProvider getprofil;
  late ProductProvider getProduk;

  @override
  void initState() {
    // TODO: implement initState
    getProfile();
    getInit();
    super.initState();
  }

  void getProfile() async {
    getprofil = Provider.of<profilProvider>(context, listen: false);
    getprofil.profil = await getprofil.getProfile();
    setState(() {});
  }

  void getInit() async {
    getProduk = Provider.of<ProductProvider>(context, listen: false);
    await getProduk.getproduct();
    setState(() {});
  }

  var dropdownValue;
  final List<String> _dropdownValues = [
    'Converse',
    'nike',
    'nike 2',
    'vans',
    'vans 2',
    'converse 2',
    'nike 3',
    'nike 4',
  ];

  DateTime selectedDate = DateTime.now();

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
    RestockProvider restockProvider = Provider.of<RestockProvider>(context);

    handleRestock() async {
      // List<String> size = [];
      // for (var i = 0; i < sizeList.length; i++) {
      //   if (sizeListValue[i]) {
      //      size.add(sizeList[i]);
      //   }
      // }
      bool result = await restockProvider.addRestock(
        id: dropdownValue,
        nama_product: '',
        tanggal_pemesanan: tanggal.text,
        size: size.text,
        qty: qty.text,
      );
    }

    Widget inputNama() {
      return Container(
        margin: EdgeInsets.only(top: 29),
        width: double.infinity,
        height: 78,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pemesan',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
              Container(
                height: 45,
                width: 300,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: backgorundColor2),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: TextFormField(
                      readOnly: true,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: '${getprofil.profil.data?.name}',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget inputNamaProduct() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 78,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Product',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
              Container(
                height: 45,
                width: 300,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('Pilih Product yang Mau Restock'),
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          elevation: 0,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          value: dropdownValue,
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                          onChanged: (value) {
                            setState(() {
                              // test[index] = value;
                              dropdownValue = value;
                            });
                          },
                          items: getProduk.product.data?.map(
                            (element) {
                              return DropdownMenuItem(
                                child: Text('${element?.nama_product ?? "-"}'),
                                value: element?.id ?? "-",
                              );
                            },
                          ).toList()
                          // item?.size?.map(
                          //   (element) {
                          //     return DropdownMenuItem(
                          //       child: Text('${element?.size ?? "-"}'),
                          //       value: element?.size ?? "-",
                          //     );
                          //   },
                          // ).toList(),
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget inputTanggal() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 78,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Pemesanan',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        TextFormField(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          controller: tanggal,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              log('$pickedDate');
                              String formattedDate =
                                  DateFormat('dd MMMM yyyy').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                tanggal.text = formattedDate;
                                // log('${formattedDate}');
                              });
                            } else {
                              print('Date is not selected');
                            }
                          },
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/icons/calendar.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              // Container(
              //   height: 45,
              //   width: 300,
              //   margin: EdgeInsets.only(top: 8),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(14),
              //       border: Border.all(width: 1)),
              //   child: Center(
              //     child: Container(
              //       margin: EdgeInsets.only(
              //         left: 12,
              //       ),
              //       child: Row(
              //         children: [
              //           TextFormField(
              //             controller: tanggal,
              //             // '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
              //             style: primaryTextStyle.copyWith(fontWeight: medium),
              //           ),
              //           Spacer(),
              //           IconButton(
              //             onPressed: () async {
              //               final DateTime? dataTime = await showDatePicker(
              //                   context: context,
              //                   initialDate: selectedDate,
              //                   firstDate: DateTime(2000),
              //                   lastDate: DateTime(3000));
              //               if (dataTime != null) {
              //                 String formattedDate = DateFormat('dd MMMM yyyy')
              //                     .format(selectedDate);
              //                 setState(() {
              //                   tanggal.text = formattedDate;
              //                 });
              //               }
              //             },
              //             icon: Image.asset(
              //               'assets/icons/calendar.png',
              //               width: 16,
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      );
    }

    Widget inputSize() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
              Container(
                height: 45,
                width: 300,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: TextFormField(
                      controller: size,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan size yang ingin direstock',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              )
              // Container(
              //   margin: EdgeInsets.only(top: 8),
              //   width: 300,
              //   child: sizeItem(),
              // )
            ],
          ),
        ),
      );
    }

    Widget inputQuantity() {
      return Container(
        margin: EdgeInsets.only(top: 8, left: 24),
        width: double.infinity,
        height: 78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity',
              style: primaryTextStyle.copyWith(fontWeight: medium),
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
                    controller: qty,
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

    Widget restockButton() {
      return Center(
        child: Container(
          height: 50,
          width: 283,
          margin: EdgeInsets.only(top: 197),
          child: TextButton(
            onPressed: () async {
              handleRestock();
            },
            child: Text(
              'Restock',
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
          'Restock',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              inputNama(),
              inputNamaProduct(),
              inputTanggal(),
              inputSize(),
              inputQuantity(),
              restockButton()
            ],
          ),
        ),
      ),
    );
  }
}
