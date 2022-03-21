
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/widgets/bottom_bar.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool showPassword = false;

  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  ConnexionController _authController = ConnexionController();

  String avatar;
  bool _isLoading = false;

  final profilForm = GlobalKey<FormState>();

  getUserData() async{
    final prefs = await SharedPreferences.getInstance();

    _authController.getUserData();
    setState(() {
      _nomController = new TextEditingController(text: prefs.get('userFirstname'));
      _prenomController = new TextEditingController(text: prefs.get('userLastname'));
      _emailController = new TextEditingController(text: prefs.get('userEmail'));
      _phoneController = new TextEditingController(text: prefs.get('userTelephone'));
      avatar = prefs.get('userAvatar');
    });

  }


  _update(){
    if(profilForm.currentState.validate()){
      setState(() {
        _isLoading = true;
      });

      _authController.updateProfile(_nomController.text,_prenomController.text,_emailController.text,_phoneController.text).whenComplete((){
        if(_authController.status == 200){
          setState(() {
            _isLoading = false;
          });
          _flashMessage(_authController.message, 'succes');
        }
        else{
          _flashMessage(_authController.message, 'error');
          setState(() {
            _isLoading = false;
            FocusScope.of(context).requestFocus(new FocusNode());
          });
        }
      });
    }else{
      _flashMessage("Veuillez renseigner correctement le formulaire", 'error');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mon compte",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: LoadingOverlay(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [

                SizedBox(
                  height: 35,
                ),
                Form(
                  key: profilForm,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nom",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _nomController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre nom";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Prénoms ",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _prenomController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre Prénoms ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email ",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre email ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Contact ",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffFF8400),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre Contact ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                RaisedButton(
                  onPressed: _update,
                  color: Color(0xffa61019),
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        isLoading: _isLoading,
        opacity: 0.5,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'Home');
      },
        backgroundColor: Color(0xFFa61019),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _flashMessage( String message,String type){
    return Flushbar(
      backgroundColor: type == 'error'?Colors.red:Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: type== 'error'?'Erreur':'Succès',
      message: message,
      icon: type == 'error'?Icon(
        Icons.block,
        size: 28.0,
        color: Colors.white,
      ):Icon(Icons.check,color: Colors.white,),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }
}

