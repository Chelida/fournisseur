
// import 'package:bifa/models/Produit.dart';
// import 'package:bifa/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class ProductDetailPage extends StatefulWidget {
//   @override
//   _ProductDetailPageState createState() => _ProductDetailPageState();

//   Produit _produit;
//   ProductDetailPage(this._produit);
// }

// class _ProductDetailPageState extends State<ProductDetailPage> {

//   // String type;
//   // AuthController _authController = AuthController();

//   getClientType() async{
//     final prefs = await SharedPreferences.getInstance();

//     // _authController.getUserData();
//     // setState(() {
//     //   type = prefs.get('userType');
//     // });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getClientType();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffa61019),
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text('widget._produit.libelle',
//             style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white
//             )
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
//             onPressed: () {},
//           ),
//         ],
//       ),

//       body: ListView(
//           children: [
//             SizedBox(height: 20.0),
//             Hero(
//                tag: widget._produit.photo,
//                 child: Image.network('assets/images/logo.png',
//                     height: 150.0,
//                     width: 100.0,
//                     fit: BoxFit.contain
//                 )
//             ),
//             SizedBox(height: 20.0),
//         if(type == 'Grossiste')
//               Center(
//               child: Text('widget._produit.prix_grossiste FCFA',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFF17532))),
//             ),
//        if(type == 'Semi-Grossiste')
//               Center(
//               child: Text('widget._produit.prix_semi_grossiste FCFA',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFF17532))),
//             ),
//           if(type == 'Detaillant')
//               Center(
//               child: Text('widget._produit.prix_detaillant FCFA',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFF17532))),
//             ),
//             SizedBox(height: 10.0),
//             Center(
//               child: Text('widget._produit.libelle',
//                   style: TextStyle(
//                       color: Color(0xFF575E67),
//                       fontFamily: 'Montserrat',
//                       fontSize: 24.0)),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 50.0,
//                 child: Text('widget._produit.libelle',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 16.0,
//                         color: Color(0xFFB4B8B9))
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//                 child: Container(
//                     width: MediaQuery.of(context).size.width - 50.0,
//                     height: 50.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25.0),
//                         color: Color(0xFFF17532)
//                     ),
//                     child: Center(
//                         child: Text('Ajouter à votre panier',
//                           style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white
//                           ),
//                         )
//                     )
//                 )
//             )
//           ]
//       ),

//       floatingActionButton: FloatingActionButton(onPressed: () {},
//         backgroundColor: Color(0xFFa61019),
//         child: Icon(Icons.dashboard),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }