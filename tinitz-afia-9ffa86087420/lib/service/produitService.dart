
import 'package:http/http.dart' as http;
import 'package:le_fournisseur/models/produitModel.dart';

class Produitservice{

  static var client = http.Client();
   var myUrl = Uri.parse("https://devops.egaz.shop/v1/api/products");
  static Future<List<ProduitElement>> fetchProduit()async{
 
  }
}