import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/product_model.dart';
import 'package:pos_app/service/product_service.dart';

class addProductProvider with ChangeNotifier {
  productData _data = productData();

  productData get data => _data;

  set data(productData data) {
    _data = data;
    notifyListeners();
  }

  Future<bool> addProduct({
    required String nama_product,
    required double harga,
    required String stok,
    required List<int> size,
    required File gambar,
  }) async {
    try {
      productData add = await ProductService().addProduct(
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
