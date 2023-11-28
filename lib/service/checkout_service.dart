import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pos_app/model/checkout_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutService {
  String baseurl = "http://192.168.1.22:8000/api";

  Future<CheckoutModelData> checkout({
    required int keranjang_id,
    required String tanggal_pemesanan,
    required String nama,
    required List<int> listId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/cek';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> map = {
      'keranjang_id': listId,
      'tanggal_pemesanan': tanggal_pemesanan,
      'nama': nama,
    };
    for (var i = 0; i < listId.length; i++) {
      // map.addAll({"keranjang_id[$i]" : keranjang_id[i]});
    }
    log("body :  $map");
    var body = jsonEncode(map);

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = CheckoutModelData.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Add To Cart');
    }
  }
}
