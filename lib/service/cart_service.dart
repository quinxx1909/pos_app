import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  String baseurl = "http://192.168.1.24:8000/api";

  Future<CartModelData> addToCart({
    required int id_product,
    required String ukuransepatu,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var url = '$baseurl/produk_keranjang';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'id_product': id_product,
      'ukuransepatu': ukuransepatu,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log('Data : ${response.body}');

    if (response.statusCode == 200) {
      var res = CartModelData.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Add To Cart');
    }
  }

  Future<CartModel> getCart() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var url = "$baseurl/data_keranjang";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    log('Keranjang : ${response.body}');

    if (response.statusCode == 200) {
      var res = CartModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  Future<CartModel> deleteCart({
    required int id,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/hapus';
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
      var res = CartModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal menghapus data keranjang');
    }
  }
}
