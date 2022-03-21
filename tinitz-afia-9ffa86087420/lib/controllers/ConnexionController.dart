import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ConnexionController extends GetxController {
  String serverUrl = "https://devops.egaz.shop/v1/api";
  var status = RxInt(0);
  var user_role_id = RxInt(0);

  var isLoading = false.obs;
  var user_name = ''.obs;
  var user_email = ''.obs;
  var user_lastname = ''.obs;
  var user_type = ''.obs;
  var user_pays = ''.obs;
  var user_code = ''.obs;
  var user_phone = ''.obs;
  var user_adresse = ''.obs;
  var solde = RxInt(0);
  var debit = RxInt(0);
  var credit = RxInt(0);
  var token;
  var user_token = ''.obs;

  @override
  void onInit() {
  
    super.onInit();
  }


    login(String code, String password) async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.get('token');
    print("ok");


    isLoading(true);
    var url = Uri.parse('$serverUrl/login');
    final response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "code": "$code",
      "password": "$password"
    });
    print("bonsoir");
    print(response.statusCode);
    print(response.body);
    status(response.statusCode);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // print("oui oui");
      // save(data["access_token"]);
      // saveData('user_name', data["user"]["nom"]);
      // saveData('user_lastname', data["user"]["prenoms"]);
      // saveData('user_type', data["user"]["type"]);
      // saveData('user_phone', data["user"]["contact"]);
      // saveData('user_pays', data["user"]["pays"]);
      // saveData('user_email', data["user"]["email"]);
      // saveData('user_code', data["user"]["code_client"]);
      // user_token(data["access_token"]);
      // isLoading(false);
      // checking();
      // sync(data);
    } else {
      isLoading(false);
      print("Non non");
    }
  }


  


  // checkAuth() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.get('token');
  //   print("-------- init check auth --------");
  //   print(token);
  //   if (token != null) {
  //     getUserData();
  //     user_token(token);
  //   }
  // }

  // checking() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('showLogin', false);
  // }

  // /*
  //  *  login
  //  */

  // /*
  //  *  logout
  //  */
  logout() async {
    isLoading(true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    var url = Uri.parse('$serverUrl/logout');
    http.Response response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    status(response.statusCode);
    prefs.remove('token');
    prefs.remove('user_name');
    prefs.remove('user_lastname');
    prefs.remove('user_pays');
    prefs.remove('user_phone');
    prefs.remove('user_email');
    prefs.remove('user_code');
    user_name('');
    user_lastname('');
    user_type('');
    user_email('');
    user_phone('');
    user_code('');
    user_adresse('');
    solde(0);
    debit(0);
    credit(0);
    await prefs.clear();
    prefs.setBool('showLogin', true);
    isLoading(false);

    
  }

  // /*
  //  *  recuperation des infos de l'utilisateur
  //  */
  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    if (token != null) {
      var url = Uri.parse("$serverUrl/user/profile");
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        // saveData('user_name', data["data"]["user"]["nom"]);
        // saveData('user_lastname', data["data"]["user"]["prenoms"]);
        // saveData('user_type', data["data"]["user"]["type"]);
        // saveData('user_phone', data["data"]["user"]["contact"]);
        // saveData('user_pays', data["data"]["user"]["pays"]);
        // saveData('user_email', data["data"]["user"]["email"]);
        // saveData('user_code', data["data"]["user"]["code_client"]);
        // saveData('user_adresse', data["data"]["user"]["adresse"]);
        // sync(data["data"]);
        print("@@@@@@@@@@@@@@@@@@@");
        print(data["data"]);
      } else {
        print('errormsg : ${data["message"]}');
      }
    }
  }



  /*
   * modification du mot de passe de l'utilisateur
   */
  changePassword(String current_password,String new_password ) async{

 final prefs = await SharedPreferences.getInstance();
    token = prefs.get('token');
    print("ok");


    isLoading(true);
    var url = Uri.parse('$serverUrl/login');
    final response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "current_password": "$current_password",
      "new_password": "$new_password"
    });
    print("bonsoir");
    print(response.statusCode);
    print(response.body);
        print(response.statusCode);
    status(response.statusCode);
    var data = json.decode(response.body);
    print('************************ change password *********************************');
    print(data);

    if(response.statusCode == 200){
      isLoading(false);
      //getUserData();
      print(data);
    }else {
      isLoading(false);
      throw Exception();
    }

  }



  // saveBool(String ref, data) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(ref, data);
  // }

  // /*
  //  *  modification des infos de utilisateur connecte
  //  */
  // updateProfile(
  //   String nom,
  //   String prenoms,
  //   String email,
  //   String contact,
  //   String adresse,
  // ) async {
  //   isLoading(true);
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');

  //   var url = Uri.parse("$serverUrl/user/update-profile");
  //   http.Response response = await http.post(url, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   }, body: {
  //     "nom": "$nom",
  //     "prenoms": "$prenoms",
  //     "email": "$email",
  //     "contact": "$contact",
  //     "adresse": "$adresse",
  //   });
  //   status(response.statusCode);
  //   var data = json.decode(response.body);

  //   print('************************update*********************************');
  //   print(data);
  //   if (status == 200) {
  //     getUserData();
  //     print(data);
  //     isLoading(false);
  //   } else {
  //     isLoading(false);
  //     print('#### message #######');
  //     error_message(
  //         data["data"].toString().replaceAll(new RegExp(r'[^\w\s]+'), ''));
  //   }
  //   isLoading(false);
  // }

  // /*
  //  * modification du mot de passe de l'utilisateur
  //  */
  // changePassword(String currentPassword, String newPassword) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   isLoading(true);

  //   var url = Uri.parse('$serverUrl/user/change-password');
  //   final response = await http.post(url, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   }, body: {
  //     "current_password": "$currentPassword",
  //     "new_password": "$newPassword",
  //   });
  //   status(response.statusCode);
  //   var data = json.decode(response.body);
  //   print(
  //       '************************ change password *********************************');
  //   print(data);

  //   if (status == 200) {
  //     isLoading(false);
  //     //getUserData();
  //     print(data);
  //   } else {
  //     isLoading(false);
  //     throw Exception();
  //   }
  // }

  // save(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = token;
  //   prefs.setString(key, value);
  // }

  // saveData(String key, String value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }

  // saveIntData(String key, int data) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setInt(key, data);
  // }

  // sync(var data) {
  //   user_name(data["user"]["nom"]);
  //   user_lastname(data["user"]["prenoms"]);
  //   user_type(data["user"]["type"]);
  //   user_email(data["user"]["email"]);
  //   user_phone(data["user"]["contact"]);
  //   user_code(data["user"]["code_client"]);
  //   user_adresse(data["user"]["adresse"]);
  //   solde(data["compte"]["soldecourant"]);
  //   debit(data["compte"]["debit"]);
  //   credit(data["compte"]["credit"]);
  // }
}
