import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/add_customer_model.dart';
import 'package:pos_app/service/customer_service.dart';

class CustomerProvider with ChangeNotifier {
  CustomerModel _add = CustomerModel();

  CustomerModel get add => _add;

  set add(CustomerModel add) {
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
    CustomerModel customer = await CustomerService().addCustomer(
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

  Future<CustomerModel> getCustomer() async {
    CustomerModel get = await CustomerService().getCustomer();
    add = get;
    return get;
  }
}
