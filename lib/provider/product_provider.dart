import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/product_model.dart';
import 'package:pos_app/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  ProductModel _product = ProductModel();

  ProductModel get product => _product;

  set product(ProductModel product) {
    _product = product;
    notifyListeners();
  }

  Future<ProductModel> getproduct() async {
    // try {
    ProductModel dataa = await ProductService().getProduk();
    product = dataa;
    return dataa;
    // } catch (e) {
    //   throw '';
    //   print(e);
    // }
  }
}
