import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_app/model/profil_model.dart';
import 'package:pos_app/service/auth_service.dart';

class profilProvider with ChangeNotifier {
  Profil _profil = Profil();

  Profil get profil => _profil;

  set profil(Profil profil) {
    _profil = profil;
    notifyListeners();
  }

  Future<Profil> getProfile() async {
    // try {
    Profil dataa = await AuthService().profil();
    log("TEST DATA USERNAME : ${dataa.data?.name}");
    profil = dataa;
    return dataa;
    // } catch (e) {
    //   throw '';
    //   print(e);
    // }
  }
}
