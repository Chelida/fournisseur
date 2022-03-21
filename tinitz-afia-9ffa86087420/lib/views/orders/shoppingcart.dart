/*
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bifa/controllers/CartController.dart';
import 'package:bifa/controllers/CommandeController.dart';
import 'package:bifa/models/Cart.dart';
import 'package:bifa/widgets/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

import 'package:smart_select/smart_select.dart';


class ShoppingCartPage extends StatefulWidget {


  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int shoppingCartCount = 1;
  List<Cart> carts = List();
  CartController _cartController = CartController();
  CommandeController _commandeController = CommandeController();
  bool _isLoading = false;
  int entrepotId =0;


  getCart() async{
    _cartController.getCart().whenComplete(() =>
        setState((){
          carts = _cartController.carts;
        })

    );
    print(carts);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEntrepots();
    getCart();
  }

  updateProductInCart(int quantite,int produit_id){
    setState((){
      _isLoading = true;
    });
    _cartController.updateProductInCart(quantite, produit_id).whenComplete((){
      if(_cartController.status == 200){
        _cartController.getCart().whenComplete(() =>
            setState((){
              _isLoading = false;
            })
        );
      }else{
        setState((){
          _isLoading = false;
        });
      }
    });
  }

  Future getEntrepots() async {
    final String url = "https://devprepod.egaz.shop/api/client/entrepots";
    var data;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    print(token);

    var res = await https.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody["data"]["entrepots"];
      for (var i = 0; i < data.length; i++) {
        var entrepots = SmartSelectOption<int>(value: data[i]["id"], title: data[i]["libelle"]);
        entrepotOptions.add(entrepots);
      }
    });
    print('*****************************');
    print(resBody);
    return resBody;
  }


  List<SmartSelectOption<int>> entrepotOptions = [];


  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: Scaffold(
        appBar:AppBar(
          title: Text(
            "Votre panier",
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Color(0xffc2151c),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: _cart(),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context, 'Home');
        },
          backgroundColor: Color(0xFFa61019),
          child: Icon(Icons.dashboard),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
      ),
      isLoading: _isLoading,
      opacity: 0.5,
      color: Colors.white,
      progressIndicator: CircularProgressIndicator(),
    );
  }

  Widget _flashMessage( String message,String type){
    return Flushbar(
      backgroundColor: type == 'error'?Colors.red:Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: type == 'error'?"Erreur":"Succès ",
      message: message,
      icon: type == 'error'?Icon(
        Icons.dangerous,
        size: 28.0,
        color: Colors.white,
      ):Icon(Icons.check,color: Colors.white,),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }

  _cart() {
    return FutureBuilder<List>(
      future: _cartController.getCart(),
      builder: (context ,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? shoppingCartItem(snapshot.data)
            : Center(child: CircularProgressIndicator(),);
      },
    );
  }

  shoppingCartItem(List<Cart> carts) {

    return carts.length>0 ? Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 3/5,
          child: ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context,i){
                return Container(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  height: 200,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: (MediaQuery.of(context).size.width) / 3,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height:100,
                                  child: Image.network(carts[i].produit_photo,
                                    fit: BoxFit.cover,)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        int qte = carts[i].quantite - 1;
                                        setState(() {
                                          if(carts[i].quantite >=2)
                                            updateProductInCart(qte, carts[i].produit_id);
                                        });
                                      },
                                    ),
                                    Text(
                                      '${carts[i].quantite}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        int qte = carts[i].quantite+1;
                                        updateProductInCart(qte, carts[i].produit_id);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 37) / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 12.0),
                                    width: 150,
                                    child: Text(
                                      carts[i].produit_name,
                                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0,fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Feather.trash_2,color: Colors.red,),
                                    onPressed: () {
                                      AwesomeDialog(
                                          context: context,
                                          animType: AnimType.BOTTOMSLIDE,
                                          dialogType: DialogType.WARNING,
                                          body: Center(child: Text(
                                            'Voulez-vous vraiment retiré ${carts[i].produit_name} de votre panier ?',
                                            style: TextStyle(fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),
                                          ),),
                                          title: 'Panier',
                                          btnOkOnPress: (){
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            _cartController.deleteProductInCart(carts[i].id).whenComplete((){
                                              if(_cartController.status == 200){
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                Navigator.of(context).push(new MaterialPageRoute(
                                                  builder: (BuildContext context) => ShoppingCartPage(),
                                                ));
                                                _flashMessage(_cartController.message,'success');
                                              }else{
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                _flashMessage(_cartController.message,'error');
                                              }
                                            });
                                          },
                                          btnCancelOnPress: (){},
                                          btnCancelText: 'Non',
                                          btnOkText: 'Oui'
                                      )..show();
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "${carts[i].total} FCFA",
                                        style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: SmartSelect<int>.single(
                modalType: SmartSelectModalType.bottomSheet,
                title: 'entrepot',
                value: entrepotId,
                options: entrepotOptions,
                onChange: (val) => setState(() => entrepotId = val)
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
          height: 75,
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                      ),
                      Text("${_cartController.montantttc} FCFA",
                        style: TextStyle(fontFamily: 'Montserrat',),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            color: Color(0xffc2151c),
            onPressed: () async{
              setState(() {
                _isLoading = true;
              });
              _commandeController.storeCommande(entrepotId).whenComplete((){
                if(_commandeController.status == 200){
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.pushNamed(context, 'Commande');
                  _flashMessage(_commandeController.message,'success');
                }else{
                  setState(() {
                    _isLoading =false;
                  });
                  _flashMessage(_commandeController.message,'error');
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Valider",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ):Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("votre panier est vide",
                style:TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                )

            ),
            Padding(padding: EdgeInsets.all(2)),
          ],
        )
    );

  }

}

 */
