import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/add_customer_model.dart';
import 'package:pos_app/service/customer_service.dart';

class CustomerProvider with ChangeNotifier {
  addCustomerModel _add = addCustomerModel();

  addCustomerModel get add => _add;

  set add(addCustomerModel add) {
    _add = add;
    notifyListeners();
  }

  Future<bool> addCustomer({
    required String nama,
    required String umur,
    required String gender,
    required String alamat,
    required String tanggal_lahir,
    required String status,
  }) async {
    addCustomerModel customer = await CustomerService().addCustomer(
      nama: nama,
      umur: umur,
      gender: gender,
      alamat: alamat,
      tanggal_lahir: tanggal_lahir,
      status: status,
    );
    add = customer;
    return true;
  }
}
