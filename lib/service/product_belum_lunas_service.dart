import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/product_belum_lunas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductBelumLunasService {
  String baseurl = "http://192.168.1.22:8000/api";

  Future<BelumLunasModel> getProduk() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/data_belum_lunas";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = BelumLunasModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
