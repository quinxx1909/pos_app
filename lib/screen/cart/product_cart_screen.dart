import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/provider/cart_provider.dart';
import 'package:pos_app/provider/checkout_provider.dart';
import 'package:pos_app/provider/customer_provider.dart';
import 'package:pos_app/theme.dart';
import 'package:provider/provider.dart';

class productCartScreen extends StatefulWidget {
  @override
  State<productCartScreen> createState() => _productCartScreenState();
}

class _productCartScreenState extends State<productCartScreen> {
  TextEditingController tanggal = TextEditingController();
  late CartProvider getCart;
  late CustomerProvider customer;
  var dropdownValue;

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
    getCustomer();
    super.initState();
  }

  getInit() async {
    getCart = Provider.of<CartProvider>(context, listen: false);
    await getCart.getcart();
    setState(() {});
  }

  getCustomer() async {
    customer = Provider.of<CustomerProvider>(context, listen: false);
    var c = await customer.getCustomer();
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOut = Provider.of<CheckOutProvider>(context);
    final f1 = context.watch<CartProvider>().cart;

    handleCheckout() async {
      List<int> listId = [];
      for (var i = 0; i < (f1.data?.length ?? 0); i++) {
        listId.add(f1.data![i]!.id!);
      }

      if (await checkOut.checkout(
        keranjang_id: f1.data!.first!.id!,
        tanggal_pemesanan: tanggal.text,
        nama: dropdownValue,
        listId: listId,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            'Checkout Success',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 1),
        ));
      }
    }

    Future printButton() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actionsPadding:
              EdgeInsets.only(left: 20, right: 20, top: 34, bottom: 34),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukkan nama pelanggan',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: 282,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
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
                              dropdownValue = value;
                            });
                          },
                          items: customer.add.data?.map(
                            (element) {
                              return DropdownMenuItem(
                                child: Text('${element?.nama ?? "-"}'),
                                value: element?.nama!,
                              );
                            },
                          ).toList()),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukkan Tanggal Pemesanan',
                style:
                    primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: 282,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: TextFormField(
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
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 40,
                width: 140,
                margin: EdgeInsets.only(left: 12, right: 12, top: 48),
                child: TextButton(
                  onPressed: () {
                    handleCheckout();
                  },
                  child: Text(
                    'continue',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            )
          ],
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
          'Product Cart',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        actions: [
          IconButton(
            onPressed: () {
              printButton();
            },
            icon: Image.asset(
              'assets/icons/atm.png',
              width: 24,
            ),
          )
        ],
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
            final item = f1.data![index];
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
                                'http://192.168.1.15:8000/gambar/${item?.gambar}'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12, top: 8),
                    width: double.infinity,
                    child: Text(
                      '${item?.nama}',
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
                          onPressed: () {
                            CartProvider().deleteCart(id: item!.id!);
                            setState(() {
                              getInit();
                            });
                          },
                          child: Text(
                            'Delete',
                            style: secondaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 12),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: cancelColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10),
                        height: 30,
                        child: Center(
                          child: Text(
                            '${item?.ukuransepatu}',
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
