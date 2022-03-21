import 'dart:io';

import 'package:le_fournisseur/controllers/AuthController.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController _authController = AuthController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  final loginform = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: LoadingOverlay(
        child: Stack(
          children: [
            //BackgroundImage(image: 'assets/images/login_bg.png',),
            BackgroundImage(image: 'assets/images/bg.jpg'),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                height: double.infinity,
                child: Form(
                  key: loginform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Le fournisseur',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Numero',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        inputController: email,
                      ),
                      PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Mot de passe',
                        inputAction: TextInputAction.done,
                        inputController: password,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                        child: Text(
                          'mot de passe oublié ?',
                          style: TextStyle(
                              fontFamily:'Montserrat',
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),


                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffa61019),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final result = await InternetAddress.lookup('google.com');
                              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                print('connected');

                                if(loginform.currentState.validate()){
                                  _authController.login(email.text,password.text.trim()).whenComplete((){
                                    if(_authController.status == 200){
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pushNamed(context, 'Home');
                                    }else{
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Flushbar(
                                        backgroundColor: Colors.red,
                                        leftBarIndicatorColor: Colors.white,
                                        title: "Erreur de connexion",
                                        message: _authController.message,
                                        icon: Icon(
                                          Icons.block,
                                          size: 28.0,
                                          color: Colors.white,
                                        ),
                                        duration: Duration(seconds: 10),
                                        isDismissible: false,
                                      )..show(context);
                                    }
                                  });
                                }
                              }
                            } on SocketException catch (_) {
                              print('not connected');
                              setState(() {
                                _isLoading = false;
                              });
                              Flushbar(
                                backgroundColor: Colors.red,
                                leftBarIndicatorColor: Colors.white,
                                title: "Erreur de connexion",
                                message: 'Veuillez vérifier votre connexion internet',
                                icon: Icon(
                                  Icons.block,
                                  size: 28.0,
                                  color: Colors.white,
                                ),
                                duration: Duration(seconds: 10),
                                isDismissible: false,
                              )..show(context);
                            }

                          },
                          child: Text(
                            'Connexion',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        isLoading: _isLoading,
        opacity: 0.5,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }
}
