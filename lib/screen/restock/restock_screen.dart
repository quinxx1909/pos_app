import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/theme.dart';

class restockScreen extends StatefulWidget {
  const restockScreen({super.key});

  @override
  State<restockScreen> createState() => _restockScreenState();
}

class _restockScreenState extends State<restockScreen> {
  String dropdownValue = 'Converse';
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

  @override
  Widget build(BuildContext context) {
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
                          hintText: 'VINKCY FIRMAN PRATAMA',
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
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        elevation: 0,
                        value: dropdownValue,
                        style: primaryTextStyle.copyWith(fontWeight: medium),
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
                height: 45,
                width: 300,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          DateFormat('dd MMMM yyyy').format(selectedDate),
                          // '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () async {
                            final DateTime? dataTime = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000));
                            if (dataTime != null) {
                              setState(() {
                                selectedDate = dataTime;
                              });
                            }
                          },
                          icon: Image.asset(
                            'assets/icons/calendar.png',
                            width: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
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
                margin: EdgeInsets.only(top: 8),
                width: 300,
                child: Center(
                  child: Container(
                    child: CustomRadioButton(
                      unSelectedColor: Colors.white,
                      selectedBorderColor: primaryColor,
                      unSelectedBorderColor: Colors.black,
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: textColor,
                          unSelectedColor: Colors.black,
                          textStyle: primaryTextStyle.copyWith(fontSize: 14)),
                      enableShape: true,
                      shapeRadius: 6,
                      elevation: 0,
                      height: 26,
                      width: 50,
                      buttonLables: [
                        "37",
                        "38",
                        "39",
                        "40",
                        "41",
                        "42",
                        "43",
                        "44",
                      ],
                      buttonValues: [
                        "37",
                        "38",
                        "39",
                        "40",
                        "41",
                        "42",
                        "43",
                        "44",
                      ],
                      radioButtonValue: (value) => print(value),
                      selectedColor: primaryColor,
                      defaultSelected: "37",
                    ),
                  ),
                ),
              )
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
            onPressed: () {},
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
