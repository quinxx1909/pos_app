import 'dart:io';
import 'dart:developer';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:pos_app/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  String baseurl = "http://192.168.1.12:8000/api";

  Future<productData> addProduct({
    required String nama_product,
    required double harga,
    required String stok,
    required List<int> size,
    required File gambar,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/new_product';
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Connection': 'Keep-Alive',
      'Authorization': 'Bearer $token'
    };

    var stream = http.ByteStream(DelegatingStream.typed(gambar.openRead()));
    var length = await gambar.length();

    var request = http.MultipartRequest("POST", Uri.parse(url));
    var multipartFile = http.MultipartFile('gambar', stream, length,
        filename: basename(gambar.path));

    log("List size : $size");
    for (int i = 0; i < size.length; i++) {}
    log("gambar : $gambar");
    log("harga : $harga");
    log("stok : $stok");

    request.fields.addAll({
      'nama_product': nama_product,
      'harga': harga.toString(),
      'stok': stok,
      'size': size.toString(),
    });
    request.files.add(multipartFile);
    request.headers.addAll(headers);

    var response = await http.Response.fromStream(await request.send());

    // var response = await http.post(
    //   Uri.parse(url),
    //   headers: headers,
    //   body: body,
    // );

    log("RESPONSE add product : ${response.body}");

    if (response.statusCode == 200) {
      var res = productData.fromJson(jsonDecode(response.body));

      return res;
      log("edit data : $res");
    } else {
      throw Exception('Gagal Add Product');
    }
  }
}
