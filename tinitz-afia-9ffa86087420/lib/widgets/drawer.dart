import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerPage();
  }
}
class _DrawerPage extends State<DrawerPage>{
  // AuthController databaseHelper = new AuthController();

  String email = '';
  String name= '';
  String telephone= '';
  String type= '';
  String avatar= '';
  String code= '';
  PackageInfo _packageInfo = PackageInfo(
    version: 'Unknown',
  );
  var date = DateTime.now();

  Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });


  }

  // getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = prefs.get('userFirstname')+' '+prefs.get('userLastname');
  //     email = prefs.get('userEmail');
  //     avatar = prefs.get('userAvatar');
  //     telephone = prefs.get('userTelephone');
  //     type = prefs.get('userType');
  //     code = prefs.get('userCode');
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();
    getAppInfo();

  }
  final ConnexionController _authController = Get.put(ConnexionController());

  logout(){
    _authController.logout();
    Navigator.pushNamed(context, '/');
    Flushbar(
      backgroundColor: Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: "Déconnexion",
      message: "Vous vous êtes déconnecté avec succès",
      icon: Icon(
        Icons.check,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Center(
            child: Container(
              height: 250,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                   
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(100),image: DecorationImage(image: AssetImage('assets/images/register_bg.png'),fit: BoxFit.cover),),
                    ),
                    Text(
                        'Domi orphelia',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                        )
                    ),
                    Text(
                        '0767496674',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text(
                        'TINITZ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffc2151c),
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text(
                        'Particulier',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffc2151c),
                            fontWeight: FontWeight.bold
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Tableau de bord',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'Home');
            },
          ),
          Divider(height: 2,),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.truck),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Bon de commande',
                    style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'Commande');
            },
          ),

          Divider(height: 2,),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.file_plus),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Enregister commande',
                    style:TextStyle(
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'Checkout');
            },
          ),


          Divider(height: 2,),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.file_text),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Mes factures',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'Facture');
            },
          ),

          Divider(height: 2,),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.file_text),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Liste de produits',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'produit');
            },
          ),
          Divider(height: 2,),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.bell),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Notifications',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, 'Notification');
            },
          ),

          Divider(height: 2,),


          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Feather.log_out),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Déconnexion',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            onTap: (){
              AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.WARNING,
                  title: 'Déconnexion',
                  desc:   'Voulez-vous vraiment vous déconnectez ?',
                  btnCancelText: 'Non',
                  btnOkText: 'Oui',
                  btnOkOnPress: () {
                    logout();
                  },
                  btnCancelOnPress: (){}
              )..show();
            },
          ),
          SizedBox(height: 5,),

          SizedBox(
           height: 100,
          ),
          ListTile(
            title: Column(
              children: [
                Text("Version ${_packageInfo.version}",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      color: Colors.grey[400]
                  ),
                ),
                Text("Copyright © ${date.year} Tinitz \n Tous droits réservés",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      color: Colors.grey[400]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}