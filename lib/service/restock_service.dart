import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/restock_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestockService {
  String baseurl = "http://192.168.1.25:8000/api";

  Future<Restock> addRestock({
    required int id,
    required String nama_product,
    required String tanggal_pemesanan,
    required String size,
    required String qty,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var url = '$baseurl/restock';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'id': id,
      'nama_product': nama_product,
      'tanggal_pemesanan': tanggal_pemesanan,
      'size': size,
      'qty': qty,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = Restock.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Add To Cart');
    }
  }

  Future<Restock> getRestock() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/data_restock";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    log('Data Restock : ${response.body}');

    if (response.statusCode == 200) {
      var res = Restock.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  Future<Restock> checkRestock({
    required int id,
    required int id_product,
    required int qty,
    required String note,
    required String size,
    required String status,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var url = '$baseurl/validator';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'id': id,
      'id_product': id_product,
      'note': note,
      'size': size,
      'qty': qty.toString(),
      'status': status,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = Restock.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Restock');
    }
  }

  Future<Restock> deleteRestock({
    required int id,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/hapus_validator';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var body = jsonEncode({
      "id": id,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Cart : ${response.body}');

    if (response.statusCode == 200) {
      var res = Restock.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal menghapus data keranjang');
    }
  }
}
