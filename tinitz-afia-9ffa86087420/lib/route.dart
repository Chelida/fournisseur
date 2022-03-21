// import 'package:bifa/views/auth/log.dart';
// import 'package:bifa/views/screens.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class RoutePage extends StatefulWidget {

//   @override
//   State<StatefulWidget> createState() => new _RoutePageState();
// }

// class _RoutePageState extends State<RoutePage> {
//   bool check;
//   @override
//   initState(){
//     super.initState();
//     checking();
//   }

//   void checking() async {
//     final prefs = await SharedPreferences.getInstance();
//     final value = prefs.get('showLogin');
//     print('----------------------checking---------------------');
//     print(value);
//     setState(() {
//       check = value;
//     });
//     print('-----------------------end checking--------------------');

//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO show login or home page depending on user login state

//     switch (check) {
//       case true:
//         return new LoginPage();
//         break;
//       case false:
//         return new HomePage();
//         break;
//       default:
//         return new LoginPage();
//     }
//   }
// }