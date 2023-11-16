import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/checkout_model.dart';
import 'package:pos_app/service/checkout_service.dart';

class CheckOutProvider with ChangeNotifier {
  CheckoutModelData cek = CheckoutModelData();

  CheckoutModelData get _cek => cek;

  set _cek(CheckoutModelData _cek) {
    _cek = cek;
    notifyListeners();
  }

  Future<bool> checkout({
    required int keranjang_id,
    required String tanggal_pemesanan,
    required String nama,
    required List<int> listId,
  }) async {
    try {
      CheckoutModelData checkout = await CheckoutService().checkout(
        keranjang_id: keranjang_id,
        tanggal_pemesanan: tanggal_pemesanan,
        nama: nama,
        listId: listId,
      );
      cek = checkout;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
