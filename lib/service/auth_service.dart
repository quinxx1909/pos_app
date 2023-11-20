import 'dart:convert';
import 'dart:developer';

import 'package:pos_app/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:pos_app/model/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseurl = "http://192.168.1.25:8000/api";

  Future<AuthData> register({
    required String name,
    required String email,
    required String password,
    required String is_superadmin,
  }) async {
    var url = '$baseurl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'is_superadmin': is_superadmin,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      var res = AuthData.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<Auth> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseurl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    // if (body.length == 0) {
    //   throw Exception('Gagal login');
    // } else {
    //   if (body[0] == 'superadmin') {}
    // }

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      log("TES");
      Auth res = Auth.fromJson(jsonDecode(response.body));
      // var res = UserModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<AuthData> forgotpassword({
    required String email,
    required String password,
  }) async {
    var url = '$baseurl/ubah_pw';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      log("TES");
      AuthData res = AuthData.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<Profil> profil() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = '$baseurl/data';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };

    var response = await http.get(Uri.parse(url), headers: header);

    log(response.body);

    if (response.statusCode == 200) {
      var res = Profil.fromJson(jsonDecode(response.body));
      return res;
    } else {
      throw Exception('Gagal get Profil');
    }
  }
}
