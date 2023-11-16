import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/provider/customer_provider.dart';
import 'package:pos_app/theme.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController nama = TextEditingController();
  TextEditingController umur = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();

  String? jeniskelamin;

  void PilihGender(String? value) {
    setState(() {
      jeniskelamin = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    tanggal_lahir.text = '';
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    handleAddCustomer() async {
      bool result = await CustomerProvider().addCustomer(
        nama: nama.text,
        umur: umur.text,
        gender: jeniskelamin.toString(),
        alamat: alamat.text,
        tanggal_lahir: tanggal_lahir.text,
        status: 'silver',
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 35),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: nama,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Name Customer',
                          hintStyle: transparantTextStyle),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget ageInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Umur',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: umur,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Umur Customer',
                          hintStyle: transparantTextStyle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget genderInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                child: Center(
                  child: buildGenderFormField(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget alamatInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: alamat,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Alamat Customer',
                          hintStyle: transparantTextStyle),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget birtdayfield() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: 327,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                width: 283,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      controller: tanggal_lahir,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('dd MMMM yyyy').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            tanggal_lahir.text = formattedDate;
                          });
                        } else {
                          print('Date is not selected');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
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
            'Add Customer',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameInput(),
                  ageInput(),
                  genderInput(),
                  alamatInput(),
                  birtdayfield(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  handleAddCustomer();
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                style: TextButton.styleFrom(backgroundColor: primaryColor),
              ),
            ),
          ),
        ));
  }

  Row buildGenderFormField() {
    return Row(
      children: [
        Radio(
          value: "Laki Laki",
          groupValue: jeniskelamin,
          activeColor: primaryColor,
          fillColor: MaterialStateProperty.all(primaryColor),
          splashRadius: 20,
          onChanged: (String? value) {
            setState(() {
              PilihGender(value);
            });
          },
        ),
        Text(
          'Laki-laki',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Radio(
          value: "Perempuan",
          groupValue: jeniskelamin,
          activeColor: primaryColor,
          fillColor: MaterialStateProperty.all(primaryColor),
          splashRadius: 20,
          onChanged: (String? value) {
            setState(() {
              PilihGender(value);
            });
          },
        ),
        Text(
          'Perempuan',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        )
      ],
    );
  }
}
