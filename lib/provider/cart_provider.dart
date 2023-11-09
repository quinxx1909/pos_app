import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/cart_model.dart';
import 'package:pos_app/model/product_model.dart';
import 'package:pos_app/service/cart_service.dart';
import 'package:pos_app/service/product_service.dart';

class CartProvider with ChangeNotifier {
  CartModel _cart = CartModel();

  CartModel get cart => _cart;

  set cart(CartModel cart) {
    _cart = cart;
    notifyListeners();
  }

  Future<CartModel> getcart() async {
    // try {
    CartModel cartModel = await CartService().getCart();
    log("Nama Product : ${cartModel.data?.first?.nama}");
    cart = cartModel;
    return cartModel;
    // } catch (e) {
    //   throw '';
    //   print(e);
    // }
  }

  Future<bool> deleteCart({
    required int id,
  }) async {
    CartModel delete = await CartService().deleteCart(
      id: id,
    );
    cart = delete;
    return true;
  }
}
