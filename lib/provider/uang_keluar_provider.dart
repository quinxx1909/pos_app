import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/uang_keluar_model.dart';
import 'package:pos_app/service/uang_keluar_service.dart';

class UangKeluarProvider with ChangeNotifier {
  UangKeluarModel _uang = UangKeluarModel();

  UangKeluarModel get uang => _uang;

  set uang(UangKeluarModel uang) {
    _uang = uang;
    notifyListeners();
  }

  Future<UangKeluarModel> getUangKeluar() async {
    UangKeluarModel get = await UangKeluarService().getUangKeluar();
    // log('Nama Produk : ${get.data?.first?.}');
    uang = get;
    return get;
  }
}
