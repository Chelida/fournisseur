import 'package:le_fournisseur/models/Notification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  String serverUrl = "https://devops.egaz.shop/v1/api";
  int status;
  var solde;
  var nbcommande;
  var nblivraison;
  String message;

  var token;
  List<Notif> notifications = List();

  /**
   *  connexion
   */
  login(String telephone, String password) async {
    var url = Uri.parse('$serverUrl/login');
    final response = await http.post(url,
        headers: {'Accept': 'application/json'},
        body: {"telephone": "$telephone", "password": "$password"});
    status = response.statusCode;
    print(response.body);

    var data = json.decode(response.body);
    print(data);
    print('bonjour');
    message = data["message"];
    if (response.statusCode == 200) {
      save(data["data"]["access_token"].toString());
      saveIntData('userId', data["data"]["user"]["id"]);
      saveData('userEmail', data["data"]["user"]["email"]);
      saveData('userAvatar', data["data"]["user"]["photo"]);
      saveData('userFirstname', data["data"]["user"]["firstname"]);
      saveData('userLastname', data["data"]["user"]["lastname"]);
      saveData('userTelephone', data["data"]["user"]["telephone"]);
      saveData('userCode', data["data"]["user"]["code"]);
      saveData('userType', data["data"]["type"]);
      solde = data["data"]["solde"];
      nbcommande = data["data"]["nbcommande"];
      nblivraison = data["data"]["nblivraison"];
      checking();
    } else {
      print('errormsg : ${data["message"]}');
    }
  }

  /**
   *  deconnexion
   */
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    print(token);

    var url = Uri.parse('$serverUrl/login');
    final response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response.body);
    var data = json.decode(response.body);
    status = response.statusCode;
    print(status);
    prefs.remove('token');
    prefs.remove('userId');
    prefs.remove('userEmail');
    prefs.remove('userAvatar');
    prefs.remove('userFirstname');
    prefs.remove('userLastname');
    prefs.remove('userTelephone');
    prefs.remove('userType');
    prefs.remove('userCode');
    print(token);
    prefs.setBool('showLogin', true);
  }

  // /**
  //  *  recuperation des infos de l'utilisateur
  //  */
  //  getUserData() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //   String myUrl = "$serverUrl/client/profile";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       });

  //   var data =  json.decode(response.body);
  //   print(data);
  //   saveData('userEmail', data["data"]["user"]["email"]);
  //   saveData('userAvatar', data["data"]["user"]["photo"]);
  //   saveData('userFirstname', data["data"]["user"]["firstname"]);
  //   saveData('userLastname', data["data"]["user"]["lastname"]);
  //   saveData('userTelephone', data["data"]["user"]["telephone"]);
  //   saveData('userType', data["data"]["type"]);
  //   solde = data["data"]["solde"];
  //   nbcommande = data["data"]["nbcommande"];
  //   nblivraison = data["data"]["nblivraison"];

  //   print('############################');
  //   print(data);

  //   return data;
  // }

  // saveBool(String ref, data) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(ref, data);
  // }

  // /**
  //  *  modification des infos de utilisateur connecte
  //  */
  // updateProfile(String firstname ,String lastname,String email , String telephone) async{

  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //   String myUrl = "$serverUrl/client/profile/update";
  //   http.Response response = await http.post(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       },
  //       body: {
  //         "firstname": "$firstname",
  //         "lastname": "$lastname",
  //         "email": "$email",
  //         "telephone" : "$telephone",
  //       } ) ;
  //   status = response.statusCode;
  //   var data = json.decode(response.body);

  //   print('************************update*********************************');
  //   print(data);
  //   print('************************update*********************************');
  //   saveData('userEmail', data["data"]["user"]["email"]);
  //   saveData('userAvatar', data["data"]["user"]["photo"]);
  //   saveData('userAdresse', data["data"]["user"]["adresse"]);
  //   saveData('userFirstname', data["data"]["user"]["firstname"]);
  //   saveData('userLastname', data["data"]["user"]["lastname"]);
  //   saveData('userTelephone', data["data"]["user"]["telephone"]);

  //   message = data["message"];
  //   if(status == 200){
  //     getUserData();
  //     print(data);
  //   }else {
  //     throw Exception();
  //   }

  // }

  // /**
  //  *  changement de la photo de profil
  //  */
  // updateProfileAvatar(String base64Image,String fileName) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   http.Response response = await http.post('$serverUrl/client/change-avatar',
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       },body: {
  //         "image": base64Image,
  //         "name": fileName,
  //       });
  //   status = response.statusCode;
  //   var data = json.decode(response.body);
  //   print(data);
  //   saveData('userAvatar', data["data"]["user"]["photo"]);

  //   message = data["message"];
  //   if(status == 200){
  //     getUserData();
  //     print(data);
  //   }else {
  //     throw Exception();
  //   }
  // }

  // /**
  //  * modification du mot de passe de l'utilisateur
  //  */
  // changePassword(String currentPassword,String newPassword) async{

  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //   String myUrl = "$serverUrl/client/password/reset";
  //   final response = await  http.post(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       },
  //       body: {
  //         "current_password": "$currentPassword",
  //         "new_password": "$newPassword",
  //       });
  //   status = response.statusCode;
  //   var data = json.decode(response.body);
  //   print('************************ change password *********************************');
  //   print(data);

  //   message = data["message"];
  //   if(status == 200){
  //     getUserData();
  //     print(data);
  //   }else {
  //     throw Exception();
  //   }

  // }

  // /**
  //  * recuperation des notifications du client
  //  */
  // Future<List> getNotification() async{

  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //   String myUrl = "$serverUrl/client/notifications";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       });
  //   var data =  json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     notifications = (data["data"]["notifications"] as List)
  //         .map((data) => new Notif.fromJson(data))
  //         .toList();

  //     return notifications;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }

  // }

  save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  saveIntData(String key, int data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, data);
  }

  // check if is first connexion
  checking() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showLogin', false);
  }
}
