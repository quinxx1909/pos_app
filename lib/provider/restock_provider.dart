import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/add_product_model.dart';
import 'package:pos_app/model/restock_model.dart';
import 'package:pos_app/service/restock_service.dart';

class RestockProvider with ChangeNotifier {
  Restock _restock = Restock();

  Restock get restock => _restock;

  set restock(Restock restock) {
    _restock = restock;
    notifyListeners();
  }

  Future<bool> addRestock({
    required int id,
    required String nama_product,
    required String tanggal_pemesanan,
    required String size,
    required String qty,
  }) async {
    try {
      Restock restockk = await RestockService().addRestock(
        id: id,
        nama_product: nama_product,
        tanggal_pemesanan: tanggal_pemesanan,
        size: size,
        qty: qty,
      );
      restock = restockk;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Restock> getRestock() async {
    Restock stok = await RestockService().getRestock();
    restock = stok;
    return stok;
  }

  Future<bool> checkRestock({
    required int id,
    required int id_product,
    required int qty,
    required String note,
    required String size,
    required String status,
  }) async {
    try {
      Restock tambah = await RestockService().checkRestock(
        id: id,
        id_product: id_product,
        qty: qty,
        note: note,
        size: size,
        status: status,
      );
      restock = tambah;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteRestock({
    required int id,
  }) async {
    Restock delete = await RestockService().deleteRestock(
      id: id,
    );
    restock = delete;
    return true;
  }
}
