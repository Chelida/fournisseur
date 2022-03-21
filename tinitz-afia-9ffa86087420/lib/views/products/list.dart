// import 'package:bifa/controllers/ProduitController.dart';
// import 'package:bifa/models/produitModel.dart';

// import 'package:bifa/widgets/products.dart';
// import 'package:bifa/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class ProductListPage extends StatefulWidget {
//   int categorieId;

//   ProductListPage(this.categorieId);
//   @override
//   _ProductListPageState createState() => _ProductListPageState();
// }

// class _ProductListPageState extends State<ProductListPage> {
//   ProduitController _produitController = ProduitController();

//   List<Categorie> categories = List();
//   List<Widget> tabs = List();
//   String serverUrl = "https://devops.egaz.shop/v1/api";

//   getcategorie() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');

//     var url = Uri.parse('$serverUrl/products');
//     final response = await http.post(url, headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });
//     var data = json.decode(response.body);
//     print(data);
//     if (response.statusCode == 200) {
//       categories = (data["data"]["categorie"] as List)
//           .map((data) => new Categorie.fromJson(data))
//           .toList();
//       setState(() {
//         var categorie = data["data"]["categorie"];
//         for (var i = 0; i < categorie.length; i++) {
//           tabs.add(Tab(
//             child: Text(categorie[i]['libelle'],
//                 style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold)),
//           ));
//         }
//       });
//       print('#######################');
//       print(categories);
//       return categories;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getcategorie();
//     _produitController.getProductCategorie().whenComplete(() => setState(() {
//           categories = _produitController.categories.cast<Categorie>();
//           print(categories.length);
//         }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffc2151c),
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text('Passer une commande',
//             style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(
//               context,
//             );
//           },
//         ),
//       ),
//       body: DefaultTabController(
//         length: 20,
//         child: ListView(
//           padding: EdgeInsets.only(left: 20.0),
//           children: <Widget>[
//             SizedBox(height: 15.0),
//             TabBar(
//               indicatorColor: Color(0xfff68a1f),
//               labelColor: Color(0xfff68a1f),
//               isScrollable: true,
//               labelPadding: EdgeInsets.only(right: 45.0),
//               unselectedLabelColor: Color(0xFFCDCDCD),
//               tabs: tabs,
//             ),
//             Container(
//                 height: MediaQuery.of(context).size.height - 50.0,
//                 width: double.infinity,
//                 child: TabBarView(children: [
//                   if (categories.length > 0)
//                     for (var i = 0; i < categories.length; i++)
//                       ProductListPage(categories[i].id),
//                 ]))
//           ],
//         ),
//       ),
//       // Center(child: CircularProgressIndicator()),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, 'Home');
//         },
//         backgroundColor: Color(0xFFa61019),
//         child: Icon(Icons.dashboard),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }
