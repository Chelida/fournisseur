import 'dart:math';


import 'package:flutter/material.dart';
import 'package:le_fournisseur/views/auth/forgot-password.dart';
import 'package:le_fournisseur/views/auth/log.dart';
import 'package:le_fournisseur/views/home.dart';
import 'package:le_fournisseur/views/invoices/list.dart';
import 'package:le_fournisseur/views/orders/checkout.dart';
import 'package:le_fournisseur/views/orders/order.dart';
import 'package:le_fournisseur/views/orders/shipping.dart';
import 'package:le_fournisseur/views/orders/versements.dart';
import 'package:le_fournisseur/views/products/mesProduits.dart';
import 'package:le_fournisseur/views/settings/changepassword.dart';
import 'package:le_fournisseur/views/settings/notification.dart';
import 'package:le_fournisseur/views/settings/profil.dart';
import 'package:le_fournisseur/views/settings/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {


//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bifa',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: 'Route',
    
//     );
//   }
// }


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final AuthController authController = Get.put(AuthController(),permanent: true);

    return GetMaterialApp(
      title: 'Le fournisseur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Log(),
        routes: {
       
        'Home': (context) => HomePage(),
        
        //'Panier': (context) => ShoppingCartPage(),
        'Commande': (context) => OrderPage(),
        'Livraison': (context) => ShippingPage(),
        'Versement': (context) => VersementPage(),
        
        'Parametre': (context) => SettingPage(),
        'Profil': (context) => ProfilPage(),
        'Facture': (context) => FacturePage(),
           'produit': (context) => MesProduits(),
        'Notification': (context) => NotificationPage(),
        'ForgotPassword': (context) => ForgotPassword(),
        'ChangePassword': (context) => ChangePasswordPage(),
        'Checkout': (context) => CheckoutPage(),
      },
    );
  }
}

