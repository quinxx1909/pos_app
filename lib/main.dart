import 'package:flutter/material.dart';
import 'package:pos_app/provider/addproduct_provider.dart';
import 'package:pos_app/provider/auth_provider.dart';
import 'package:pos_app/provider/addcart_provider.dart';
import 'package:pos_app/provider/cart_provider.dart';
import 'package:pos_app/provider/customer_provider.dart';
import 'package:pos_app/provider/product_provider.dart';
import 'package:pos_app/provider/profil_provider.dart';
import 'package:pos_app/screen/home/admin_screen.dart';
import 'package:pos_app/screen/home/main_home.dart';
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
        },
      ),
    );
  }
}
