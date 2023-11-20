import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/add_customer_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerService {
  String baseurl = "http://192.168.1.25:8000/api";

  Future<CustomerModel> addCustomer({
    required String nama,
    required String umur,
    required String gender,
    required String alamat,
    required String tanggal_lahir,
    required String status,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/pelanggan';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var body = jsonEncode({
      'nama': nama,
      'umur': umur,
      'gender': gender,
      'alamat': alamat,
      'tanggal_lahir': tanggal_lahir,
      'status': status,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      var add = CustomerModel.fromJson(jsonDecode(response.body));
      return add;
    } else {
      throw Exception('Gagal Add New Customer');
    }
  }

  Future<CustomerModel> getCustomer() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/data_pelanggan";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    log('Product : ${response.body}');

    if (response.statusCode == 200) {
      var res = CustomerModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
