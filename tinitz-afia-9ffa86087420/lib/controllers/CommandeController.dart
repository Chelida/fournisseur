// import 'package:bifa/controllers/AuthController.dart';
// import 'package:bifa/models/Cart.dart';
// import 'package:bifa/models/Commande.dart';
// import 'package:bifa/models/CommandeItems.dart';
// import 'package:bifa/models/Facture.dart';
// import 'package:bifa/models/Versement.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';


// class CommandeController {

//   String serverUrl = "https://www.app-bifa.com/api";
//   int status;
//   String message;
//   String token;
//   var totalcredit;
//   var totaldebit;

//   int nbcommandeitems=0;


//   //enregistrer une commande
//   Future<List> storeCommande(int entrepot_id) async{
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');


//     String myUrl = "$serverUrl/client/commande/store";
//     http.Response response = await http.post(myUrl,
//         headers: {
//           'Accept':'application/json',
//           'Authorization' : 'Bearer $token'
//         },
//     );
//     var data =  json.decode(response.body);
//     status = response.statusCode;
//     print(data);
//     if (response.statusCode == 200) {

//       message = data["message"];

//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }

//   }


//   //recuperation des commande de l'utilisateur
//   Future<List> getCommande() async{
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     List<Commande> commandes = List();


//     String myUrl = "$serverUrl/client/commande";
//     http.Response response = await http.get(myUrl,
//         headers: {
//           'Accept':'application/json',
//           'Authorization' : 'Bearer $token'
//         });
//     var data =  json.decode(response.body);
//     status = response.statusCode;
//     if (response.statusCode == 200) {
//       commandes = (data["data"]["commandes"] as List)
//           .map((data) => new Commande.fromJson(data))
//           .toList();

//       return commandes;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }

//   }

//   //recuperation des commandes livree de l'utilisateur
//   Future<List> getLivraison() async{
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     List<Commande> commandes = List();


//     String myUrl = "$serverUrl/client/commande/livree";
//     http.Response response = await http.get(myUrl,
//         headers: {
//           'Accept':'application/json',
//           'Authorization' : 'Bearer $token'
//         });
//     var data =  json.decode(response.body);
//     status = response.statusCode;
//     if (response.statusCode == 200) {
//       commandes = (data["data"]["commandes"] as List)
//           .map((data) => new Commande.fromJson(data))
//           .toList();

//       return commandes;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }

//   }


//   /**
//    * recuperation des notifications du client
//    */
//   Future<List> getFacture() async{

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     List<Facture> factures = List();

//     String myUrl = "$serverUrl/client/factures";
//     http.Response response = await http.get(myUrl,
//         headers: {
//           'Accept':'application/json',
//           'Authorization' : 'Bearer $token'
//         });
//     var data =  json.decode(response.body);

//     if (response.statusCode == 200) {
//       factures = (data["data"]["factures"] as List)
//           .map((data) => new Facture.fromJson(data))
//           .toList();

//       return factures;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }

//   }


//   Future<List> getCommandeItems(id) async {

//     List<CommandeItems> commandeItems= List();
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     String myUrl = serverUrl+"/client/commande/items/${id}";
//     http.Response response = await http.get(myUrl, headers: {
//       'Accept': 'application/json',
//       'Authorization' : 'Bearer $token'
//     });
//     var data = json.decode(response.body);
//     print(data);
//     if (response.statusCode == 200) {
//       commandeItems = (data["data"]["commandeitems"] as List)
//           .map((data) => new CommandeItems.fromJson(data))
//           .toList();
//       nbcommandeitems = commandeItems.length;
//       return commandeItems;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }
//   }

//   /**
//    *recuperation des versements(paiement relative a la commande)
//    */
//   Future<List> getVersement() async {

//     List<Versement> versements = List();
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     String myUrl = serverUrl+"/client/commande/versements";
//     http.Response response = await http.get(myUrl, headers: {
//       'Accept': 'application/json',
//       'Authorization' : 'Bearer $token'
//     });
//     var data = json.decode(response.body);
//     print(data);
//     if (response.statusCode == 200) {
//       versements = (data["data"]["versements"] as List)
//           .map((data) => new Versement.fromJson(data))
//           .toList();
//       totaldebit = data["data"]["totaldebit"];
//       totalcredit = data["data"]["totalcredit"];

//       return versements;
//     } else {
//       throw Exception('Veuillez verifier votre connexion internet');
//     }
//   }



// }
