import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pos_app/model/uang_keluar_model.dart';
import 'package:pos_app/model/uang_masuk_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UangMasukService {
  String baseUrl = 'http://192.168.1.22:8000/api';

  Future<UangMasukModel> getUangMasuk() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseUrl/data_uang_masuk";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = UangMasukModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
