import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/product_belum_lunas_model.dart';

import 'package:pos_app/service/customer_service.dart';
import 'package:pos_app/service/product_belum_lunas_service.dart';

class ProductBelumLunasProvider with ChangeNotifier {
  BelumLunasModel _add = BelumLunasModel();

  BelumLunasModel get add => _add;

  set add(BelumLunasModel add) {
    _add = add;
    notifyListeners();
  }

  Future<BelumLunasModel> getProduk() async {
    BelumLunasModel get = await ProductBelumLunasService().getProduk();
    log('Nama Produk : ${get.data?.first?.namaProduct}');
    _add = get;
    return get;
  }
}
