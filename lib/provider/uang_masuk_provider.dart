import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/uang_keluar_model.dart';
import 'package:pos_app/model/uang_masuk_model.dart';
import 'package:pos_app/service/uang_keluar_service.dart';
import 'package:pos_app/service/uang_masuk_service.dart';

class UangMasukProvider with ChangeNotifier {
  UangMasukModel _uang = UangMasukModel();

  UangMasukModel get uang => _uang;

  set uang(UangMasukModel uang) {
    _uang = uang;
    notifyListeners();
  }

  Future<UangMasukModel> getUangMasuk() async {
    UangMasukModel get = await UangMasukService().getUangMasuk();
    // log('Nama Produk : ${get.data?.first?.}');
    uang = get;
    return get;
  }
}
