 import 'package:le_fournisseur/models/produitModel.dart';
 import 'package:get/get.dart';

 import 'package:http/http.dart' as http;
 import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';

 class ProduitController extends GetxController{

   String serverUrl = "https:devops.egaz.shop/v1/api";
   var status = RxInt(0);
   var message= RxString('');
   var error_message= RxString('');
   var isLoading = false.obs;
   var token ;
   RxList<ProduitElement> produit = <ProduitElement>[].obs;


   @override
   void onInit() {
     getUserProduit();
     super.onInit();
   }

   Future<List<ProduitElement>> getUserProduit() async {

     final prefs = await SharedPreferences.getInstance();
     final token = prefs.get('token');

     isLoading(true);

     var url = Uri.parse("$serverUrl/products");
     http.Response response = await http.get(url,
         headers: {
           'Accept':'application/json',
           'Authorization' : 'Bearer $token'
         });

     var data =  json.decode(response.body);
     if (response.statusCode == 200) {
       print("bien");
       isLoading(false);
       print(data["data"]);
       return  produit((data["data"] as List)
           .map((data) => new ProduitElement.fromJson(data))
           .toList());

     } else {
       isLoading(false);
       throw Exception('Veuillez verifier votre connexion internet');
     }

   }





 }


