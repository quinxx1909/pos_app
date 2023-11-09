import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/cart_model.dart';
import 'package:pos_app/service/cart_service.dart';

class AddCartProvider with ChangeNotifier {
  CartModelData _cart = CartModelData();

  CartModelData get cart => _cart;

  set cart(CartModelData cart) {
    _cart = cart;
    notifyListeners();
  }

  Future<bool> addToCart({
    required int id_product,
    required String ukuransepatu,
  }) async {
    try {
      CartModelData cartProduct = await CartService().addToCart(
        id_product: id_product,
        ukuransepatu: ukuransepatu,
      );
      cart = cartProduct;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
