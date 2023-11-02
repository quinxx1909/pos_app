import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/auth_model.dart';
import 'package:pos_app/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  AuthData _data = AuthData();

  AuthData get data => _data;

  set data(AuthData data) {
    _data = data;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String is_superadmin,
  }) async {
    try {
      AuthData dataa = await AuthService().register(
        name: name,
        email: email,
        password: password,
        is_superadmin: is_superadmin,
      );
      data = dataa;
      // _data = data;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      Auth data = await AuthService().login(
        email: email,
        password: password,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", data.data?.token ?? "-");
      log("DATA TOKEN : ${prefs.getString("token")}");
      // _data = data;
      // log("DATA : $_data");
      return true;
    } catch (e) {
      log("ERROR $e");
      return false;
    }
  }

  Future<bool> forgotpassword({
    required String email,
    required String password,
  }) async {
    try {
      AuthData pass = await AuthService().forgotpassword(
        email: email,
        password: password,
      );
      data = pass;
      // _data = data;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
