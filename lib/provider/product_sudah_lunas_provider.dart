import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/product_sudah_lunas_model.dart';
import 'package:pos_app/service/product_sudah_lunas_service.dart';

class ProductSudahLunasProvider with ChangeNotifier {
  SudahLunasModel sudah = SudahLunasModel();

  SudahLunasModel get _sudah => sudah;

  set _sudah(SudahLunasModel _sudah) {
    sudah = _sudah;
    notifyListeners();
  }

  Future<bool> addLunas({
    required int order_id,
  }) async {
    try {
      SudahLunasModel lunas = await ProductSudahLunasService().addLunas(
        order_id: order_id,
      );
      _sudah = lunas;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<SudahLunasModel> getProduk() async {
    SudahLunasModel get = await ProductSudahLunasService().getProduk();
    log('Nama Produk : ${get.data?.first?.namaProduct}');
    _sudah = get;
    return get;
  }
}
