// import 'package:bifa/controllers/AuthController.dart';
// import 'package:bifa/models/Cart.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';


// class CartController {

//   String serverUrl = "https://www.app-bifa.com/api";
//   int status;
//   String message;
//   String token;

//   var montantttc;
//   AuthController _authController = AuthController();
//   List<Cart> carts = List();



//   /**
//    * recuperation du panier de l'utilisateur
//    */
//   Future<List> getCart() async{
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');

//     String myUrl = "$serverUrl/client/cart";
//     http.Response response = await http.get(myUrl,
//         headers: {
//           'Accept':'application/json',
//           'Authorization' : 'Bearer $token'
//         });
//     var data =  json.decode(response.body);
//     print(data);
//     if (response.statusCode == 200) {
//       carts = (data["data"]["carts"] as List)
//           .map((data) => new Cart.fromJson(data))
//           .toList();

//       montantttc = data["data"]["montantttc"];
//       return carts;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }

//   }

//   /**
//    * Suppression d'un produit du panier
//    */
//   deleteProductInCart(int id) async{

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');

//     String myUrl = "$serverUrl/client/cart/delete/$id";
//     http.Response response = await http.get(myUrl,
//       headers: {
//         'Accept':'application/json',
//         'Authorization' : 'Bearer $token'
//       },);
//     status = response.statusCode;
//     var data = json.decode(response.body);


//     message = data["message"];
//     if(status == 200){

//       carts = (data["data"]["carts"] as List)
//           .map((data) => new Cart.fromJson(data))
//           .toList();

//       montantttc = data["data"]["montantttc"];
//       return carts;
//     }else {
//       throw Exception();
//     }

//   }

//   /**
//    * Modification de la quantite d'un produit dans le panier
//    */
//   updateProductInCart(int cart_id,int quantite,int produit_id,String type) async{

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');

//     String myUrl = "$serverUrl/client/cart/update";
//     http.Response response = await http.post(myUrl,
//       headers: {
//         'Accept':'application/json',
//         'Authorization' : 'Bearer $token'
//       },
//       body: {
//         "cart_id": cart_id.toString(),
//         "quantite": quantite.toString(),
//         "produit_id": produit_id.toString(),
//         //"type":type,
//       }
//     );
//     status = response.statusCode;
//     var data = json.decode(response.body);


//     message = data["message"];
//     print(data);
//     if(status == 200){
//       carts = (data["data"]["carts"] as List)
//           .map((data) => new Cart.fromJson(data))
//           .toList();

//       montantttc = data["data"]["montantttc"];
//       return carts;
//     }else {
//       throw Exception();
//     }

//   }


//   /**
//    * Ajout du produit dans le panier
//    */
//   addProductInCart(int quantite,int produit_id) async{

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');

//     String myUrl = "$serverUrl/client/cart/store";
//     http.Response response = await http.post(myUrl,
//       headers: {
//         'Accept':'application/json',
//         'Authorization' : 'Bearer $token'
//       },
//       body: {
//         "quantite": quantite.toString(),
//         "produit_id": produit_id.toString()
//       }
//     );
//     status = response.statusCode;
//     var data = json.decode(response.body);

//     message = data["message"];
//     print(data);
//     if(status == 200){

//     }else {
//       throw Exception();
//     }

//   }



// }
