import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/product_sudah_lunas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductSudahLunasService {
  String baseurl = "http://192.168.1.15:8000/api";

  Future<SudahLunasModel> addLunas({
    required int order_id,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/pesan_lunas";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var body = jsonEncode({
      'order_id': order_id,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = SudahLunasModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal add Data');
    }
  }

  Future<SudahLunasModel> getProduk() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/data_lunas";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = SudahLunasModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
