import 'package:flutter/material.dart';
import 'package:pos_app/provider/addproduct_provider.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/provider/addcart_provider.dart';
import 'package:pos_app/provider/cart_provider.dart';
import 'package:pos_app/provider/checkout_provider.dart';
import 'package:pos_app/provider/customer_provider.dart';
import 'package:pos_app/provider/product_belum_lunas_provider.dart';
import 'package:pos_app/provider/product_provider.dart';
import 'package:pos_app/provider/product_sudah_lunas_provider.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/provider/restock_provider.dart';
import 'package:pos_app/provider/uang_keluar_provider.dart';
import 'package:pos_app/provider/uang_masuk_provider.dart';
import 'package:pos_app/screen/home/admin_screen.dart';
import 'package:pos_app/screen/home/main_home.dart';
import 'package:pos_app/screen/home/product_screen.dart';
import 'package:pos_app/screen/sign_in_screen.dart';
import 'package:pos_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => profilProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => addProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddCartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestockProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckOutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductBelumLunasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductSudahLunasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UangKeluarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UangMasukProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => splashscreen(),
          '/sign-in': (context) => signinScreen(),
          '/admin': (context) => AdminScreen(),
          '/home': (context) => mainHome(),
          '/product': (context) => productScreen(),
        },
      ),
    );
  }
}
