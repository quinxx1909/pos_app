import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/add_product_model.dart';
import 'package:pos_app/service/product_service.dart';

class addProductProvider with ChangeNotifier {
  product _data = product();

  product get data => _data;

  set data(product data) {
    _data = data;
    notifyListeners();
  }

  Future<bool> addProduct({
    required String nama_product,
    required double harga,
    required String stok,
    required List<String> size,
    required File gambar,
  }) async {
    try {
      product add = await ProductService().addProduct(
        nama_product: nama_product,
        harga: harga,
        stok: stok,
        size: size,
        gambar: gambar,
      );
      data = add;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
