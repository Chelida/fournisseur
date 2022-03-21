//  import 'package:awesome_dialog/awesome_dialog.dart';

//  import 'package:bifa/controllers/CartController.dart';
//  import 'package:bifa/controllers/ProduitController.dart';
//  import 'package:bifa/models/Produit.dart';
//  import 'package:bifa/views/orders/shoppingcart.dart';
//  import 'package:bifa/views/products/show.dart';
//  import 'package:flushbar/flushbar.dart';
//  import 'package:flutter/material.dart';
//  import 'package:loading_overlay/loading_overlay.dart';
//  import 'package:shared_preferences/shared_preferences.dart';


//  class Product extends StatefulWidget {
//    @override
//    int categorieId;
//    Product(this.categorieId);
//    ProductState createState() => ProductState();
//  }

//  class ProductState extends State<Product> {

//    List<Produit> products = List();
//    ProduitController _produitController = ProduitController();
//    CartController _cartController = CartController();
//    bool _isLoading = false;
//    String type;
//    AuthController _authController = AuthController();

//    recuperation des produits tentance
//    getProduct() async{
//      _produitController.getProduct(widget.categorieId.toString()).whenComplete(() =>
//          setState((){
//            products = _produitController.produits;

//            print("############### produts ################");
//            print(products);
//          })
//      );
//    }

//    getClientType() async{
//      final prefs = await SharedPreferences.getInstance();

//      _authController.getUserData();
//      setState(() {
//        type = prefs.get('userType');
//      });
//    }


//    @override
//    void initState() {
//       TODO: implement initState
//      super.initState();
//      print(widget.categorieId);
//       getProduct();
//       getClientType();
//    }

//    @override
//    Widget build(BuildContext context) {
//      return LoadingOverlay(
//        child: Scaffold(
//          backgroundColor: Color(0xFFFCFAF8),
//          body: ListView(
//            children: <Widget>[
//              SizedBox(height: 15.0),
//              Container(
//                  padding: EdgeInsets.only(right: 15.0),
//                  width: MediaQuery.of(context).size.width - 30.0,
//                  height: MediaQuery.of(context).size.height - 50.0,
//                  child: 
//                   products.length>0 ?
//                  GridView.builder(
//                      itemCount: 20,
//                      controller: ScrollController(keepScrollOffset: false),
//                      shrinkWrap: true,
//                      scrollDirection: Axis.vertical,
//                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2,
//                        childAspectRatio: (MediaQuery.of(context).size.width/2) / (MediaQuery.of(context).size.height/3.8) * 0.8,
//                      ),
//                      itemBuilder: (BuildContext context, int index) {
//                        return GestureDetector(
//                          child: Padding(
//                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
//                              child: Container(
//                                  decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15.0),
//                                      boxShadow: [
//                                        BoxShadow(
//                                            color: Colors.grey.withOpacity(0.2),
//                                            spreadRadius: 3.0,
//                                            blurRadius: 5.0)
//                                      ],
//                                      color: Colors.white),
//                                  child: Column(children: [
//                                    Hero(
//                                         tag: products[index].photo,
//                                        child: Container(
//                                            height: 150.0,
//                                            child: FadeInImage(
//                                              placeholder: AssetImage('assets/images/logo.png'),
//                                               image: NetworkImage(products[index].photo),
//                                              fit: BoxFit.cover,
//                                            ),
//                                        )
//                                    ),
//                                    SizedBox(height: 10.0),
//                                    Text('products[index].libelle',
//                                        style: TextStyle(
//                                            color: Color(0xFF575E67),
//                                            fontFamily: 'Montserrat',
//                                            fontWeight: FontWeight.bold,
//                                            fontSize: 14.0)
//                                    ),
//                                     if(type == 'Grossiste')
//                                      Text("products[index].prix_grossiste FCFA",
//                                          style: TextStyle(
//                                              color: Color(0xffc2151c),
//                                              fontFamily: 'Montserrat',
//                                              fontSize: 16.0)
//                                      ),
//                                     if(type == 'Semi-Grossiste')
//                                      Text("products[index].prix_semi_grossiste FCFA",
//                                          style: TextStyle(
//                                              color: Color(0xffc2151c),
//                                              fontFamily: 'Montserrat',
//                                              fontSize: 16.0)
//                                      ),
//                                     if(type == 'Detaillant')
//                                      Text("products[index].prix_detaillant FCFA",
//                                          style: TextStyle(
//                                              color: Color(0xffc2151c),
//                                              fontFamily: 'Montserrat',
//                                              fontSize: 16.0)
//                                      ),
//                                    Padding(
//                                        padding: EdgeInsets.all(8.0),
//                                        child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
//                                    GestureDetector(
//                                      onTap: (){
//                                        setState(() {
//                                          _isLoading = true;
//                                        });
//                                        _cartController.addProductInCart(1, products[index].id).whenComplete((){
//                                          if(_cartController.status == 200){
//                                            setState(() {
//                                              _isLoading = false;
//                                            });
//                                            AwesomeDialog(
//                                                context: context,
//                                                animType: AnimType.BOTTOMSLIDE,
//                                                dialogType: DialogType.SUCCES,
//                                                body: Center(child: Text(
//                                                    '${products[index].libelle}  ajouté au panier avec succès',
//                                                    style:TextStyle(fontSize: 12)
//                                                ),),
//                                                title: 'Panier',
//                                                btnOkOnPress: (){

//                                                },
//                                                btnCancelOnPress: (){},
//                                                btnCancelText: 'Fermer',
//                                                btnOkText: 'Panier'
//                                            )..show();
//                                          }else{
//                                            setState(() {
//                                              _isLoading = false;
//                                            });
//                                            FlashMessage(_cartController.message, 'error');
//                                          }
//                                        },
                                    
//                                      child: Padding(
//                                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                                          child: Row(
//                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                              children: [
//                                                Icon(Icons.shopping_basket,
//                                                    color: Color(0xffc2151c), size: 16.0),
//                                                Text('Ajouter au panier',
//                                                    style: TextStyle(
//                                                        fontFamily: 'Montserrat',
//                                                        color: Color(0xffc2151c),
//                                                        fontSize: 12.0)
//                                                )
//                                              ])
//                                      ),
//                                    );}
//                                  ]})
//                              )
//                          ),

//                        );
//                      }) 
//                        Center(child: CircularProgressIndicator())
//              ),
//              SizedBox(height: 15.0)
//            ],
//          ),
//        ),
//         isLoading: _isLoading,
//        opacity: 0.5,
//        color: Colors.white,
//        progressIndicator: CircularProgressIndicator(),
//      );
//    }

//  }

//  class FlashMessage extends StatelessWidget {
//   @override
//    String message;
//    String type;
//    FlashMessage(this.message,this.type);

//    Widget build(BuildContext context) {
//      return Flushbar(
//        backgroundColor: type == 'error'?Colors.red:Colors.green,
//        leftBarIndicatorColor: Colors.white,
//        title: type == 'error'?"Erreur":"Succès ",
//        message: message,
//        icon: type == 'error'?Icon(
//          Icons.dangerous,
//          size: 28.0,
//          color: Colors.white,
//        ):Icon(Icons.check,color: Colors.white,),
//        duration: Duration(seconds: 10),
//        isDismissible: false,
//      )..show(context);
//    }
//  }