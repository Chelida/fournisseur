import 'dart:async';

import 'package:le_fournisseur/controllers/CartController.dart';
import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:le_fournisseur/models/Cart.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_select/smart_select.dart';

class CheckoutPage extends StatefulWidget {
  _CheckoutPageState createState() => _CheckoutPageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _isLoading = false;
  int entrepotId = 0;
  String type;

  final _debouncer = Debouncer(milliseconds: 500);

  getCart() async {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientType();
    getCart();
  }

  updateProductInCart(int cart_id, int quantite, int produit_id, String type) {
    // setState((){
    //   _isLoading = true;
    // });
    // _cartController.updateProductInCart(cart_id,quantite, produit_id,type).whenComplete((){
    //   if(_cartController.status == 200){
    //         setState((){
    //           _isLoading = false;
    //           getCart();
    //         });
    //   }else{
    //     setState((){
    //       _isLoading = false;
    //     });
    //   }
    // });
  }

  String typeProduit = 'carton';
  // List<SmartSelectOption<String>> typeOptions = [
  //   SmartSelectOption<String>(value: 'unitaire', title: 'Unitaire'),
  //   SmartSelectOption<String>(value: 'carton', title: 'Carton'),
  // ];

  getClientType() async {
    final prefs = await SharedPreferences.getInstance();

    // _authController.getUserData();
    setState(() {
      type = prefs.get('userType');
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Passer une commande",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffC71617),
        ),
        drawer: DrawerPage(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Chercher un article...",
                        suffixIcon: IconButton(
                          icon: Icon(Feather.search),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ),
                      onChanged: (String val) {
                        _debouncer.run(() {
                          setState(() {});
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: shoppingCartItem())
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'Home');
          },
          backgroundColor: Color(0xffC71617),
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

  Widget _flashMessage(String message, String type) {
    return Flushbar(
      backgroundColor: type == 'error' ? Color(0xffC71617) : Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: type == 'error' ? "Erreur" : "Succès ",
      message: message,
      icon: type == 'error'
          ? Icon(
              Icons.dangerous,
              size: 28.0,
              color: Colors.white,
            )
          : Icon(
              Icons.check,
              color: Colors.white,
            ),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }

  /*
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
   */

  shoppingCartItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          height: 150,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage('assets/images/order.png'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        title: Text(
                          'Ordinateur',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*Text("Prix unitaire : ${carts[i].total}",style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                            ),
                            Text("Prix carton : ${carts[i].produit_prix_carton}",style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                            ),
                            */
                            // if(type == 'Grossiste')
                            Text("2400000 FCFA",
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 16.0)),
                            // if(type == 'Semi-Grossiste')
                            Text("2600000 FCFA",
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 16.0)),
                            // if(type == 'Detaillant')
                            Text("2700000 FCFA",
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 16.0)),

                            /*
                            Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child:Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 1,
                                    ),
                                  ),
                                  child: SmartSelect<String>.single(
                                      modalType: SmartSelectModalType.popupDialog,
                                      title: 'Type',
                                      value: carts[i].type,
                                      options: typeOptions,
                                      onChange: (val) => setState(() {
                                        carts[i].type = val;
                                        updateProductInCart(carts[i].id,carts[i].quantite,carts[i].produit_id,val);
                                      })
                                  ),
                                )
                            ),*/
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () {}),
                                  Text(
                                    '30',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      // int qte = carts[i].quantite+1;
                                      // updateProductInCart(carts[i].id,qte, carts[i].produit_id,carts[i].type);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        "10007000 FCFA",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFFa61019),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding:
                EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 16.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: Color(0xffc2151c),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                //   if(_cartController.montantttc == 0){
                //     setState(() {
                //       _isLoading =false;
                //     });
                //     _flashMessage('Vous avez sélectionné aucun produit','error');
                //   }else{
                //     _commandeController.storeCommande(entrepotId).whenComplete((){
                //       if(_commandeController.status == 200){
                //         setState(() {
                //           _isLoading = false;
                //         });
                //         Navigator.pushNamed(context, 'Commande');
                //         _flashMessage(_commandeController.message,'success');
                //       }else{
                //         setState(() {
                //           _isLoading =false;
                //         });
                //         _flashMessage(_commandeController.message,'error');
                //       }
                //     });
                //   }
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
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
    // :Center(child: CircularProgressIndicator(),);
  }
}
