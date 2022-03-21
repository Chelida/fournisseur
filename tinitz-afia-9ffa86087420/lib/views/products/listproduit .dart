import 'package:le_fournisseur/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class listproduitA extends StatefulWidget {
  
  @override
  _listproduitAState createState() => _listproduitAState();
}

class _listproduitAState extends State<listproduitA> {
  
  // final ProduitController _produitController = Get.put(ProduitController());

  Future getArticleList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    RxBool isLoading = true.obs;
    var myUrl = Uri.parse("https://devops.egaz.shop/v1/api/products");
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
       'Authorization' : 'Bearer $token'
    });
     var data =  json.decode(response.body);
   if (response.statusCode==200) {
      // print(response.body);
    isLoading(false);
      // print(data["data"]["produit"]);

     print("bien") ;
    //  print(data["data"]["produits"]);

     return data["data"]["produits"];

   }else{
     print("non") ;
     return null;
   
   }
  }

  @override
  void initState() {
    super.initState();
    getArticleList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Liste des produits",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
       drawer: DrawerPage(),
      body: FutureBuilder(
        future: getArticleList(),
        builder: (context, snapshot){
          var data = snapshot.data;
          print(data.length);
           if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                    
        return 
        ListView.builder(
       //shrinkWrap: true,
       itemCount:snapshot.data.length,
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
           child: Material(
             elevation: 2.0,
             borderRadius: BorderRadius.circular(18.0),
             child: Container(
               width: MediaQuery.of(context).size.width - 30.0,
               height: 140.0,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(18.0),
                 color: Colors.white,
               ),
               child: Padding(
                 padding: const EdgeInsets.only(top: 1.0),
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           InkWell(
                             onTap: () {
                        
                             },
                             child: Container(
                               width: Get.width,
                               height: Get.height / 6.2,
                               color: Colors.white,
                               child: Column(
                                 children: [
                                   SizedBox(
                                     height: 10,
                                   ),
                                   Row(
                                     mainAxisAlignment:
                                         MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(
                                         width: Get.width / 4,
                                         height: Get.height / 10,
                                         decoration: BoxDecoration(
                                           color: Colors.red,
                                           image: DecorationImage(
                                               image: NetworkImage(
                                                 data[index]["photo"],
                                                 
                                               ),
                                               fit: BoxFit.cover,
                                               colorFilter: ColorFilter.mode(
                                                   Colors.black54,
                                                   BlendMode.darken)),
                                         ),
                                       ),
                                       Column(
                                         children: [
                                           Text(
                                              data[index]["libelle"],
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.red,
                                                 fontSize: 13.0,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           Text(
                                             "Reste :12002 FCFA",
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.grey,
                                                 fontSize: 13.0,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           Text(
                                             "Montant Total :22000 FCFA",
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.black,
                                                 fontSize: 16.0,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           Text(
                                             'factures 1',
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 15.0),
                                           ),
                                           Text(
                                             'Reference facturen : Fc22',
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.grey,
                                                 fontSize: 12.0),
                                           ),
                           
                                              Text(
                                             'Reference facturen : Fc22',
                                             style: TextStyle(
                                                 fontFamily: 'Montserrat',
                                                 color: Colors.grey,
                                                 fontSize: 12.0),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );
       });
      
      }),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Home');
        },
        backgroundColor: Color(0xffC71617),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomBar(),
    );
  }
    }




// class ProduitController extends GetxController {
//     var status = RxInt(0);
//   var produitList = List<ProduitElement>().obs;

// var isLoading = false.obs;
//   var solde = RxInt(0);
//   var debit = RxInt(0);
//   var credit = RxInt(0);
//    var token ;

//   Future getArticleList() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.get('token');
//     RxBool isLoading = true.obs;
//     var myUrl = Uri.parse("https://devops.egaz.shop/v1/api/products");
//     http.Response response = await http.get(myUrl, headers: {
//       'Accept': 'application/json',
//       'Authorization' : 'Bearer $token'
//     });
//  print(response.body);
//  print(response.statusCode);
//      var data =  json.decode(response.body);
//    if (response.statusCode==200) {
//       print(response.body);
//     isLoading(false);
//       print(data["data"]);

//      print("bien") ;
//       return  produitList((data["data"] as List)
//           .map((data) => new ProduitElement.fromJson(data))
//           .toList());

//    }else{
//      print("non") ;
//      return null;
   
//    }
//   }
// }
