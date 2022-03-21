import 'dart:convert';
import 'dart:io';


import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  String base64Image;
  String fileName;
  String avatar;
  File _image;
  AuthController _authController = AuthController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      base64Image = base64Encode(_image.readAsBytesSync());
      fileName = _image.path.split("/").last;
    });
    uploadProfilImage();
  }

  getUserAvatar() async{
    final prefs = await SharedPreferences.getInstance();

    _authController.getUserData();
    setState(() {
      avatar = prefs.get('userAvatar');
    });

  }


  uploadProfilImage() {

    _authController.updateProfileAvatar(base64Image,fileName).whenComplete((){
      print(_authController.status);
      if(_authController.status == 200){
        _flashMessage(_authController.message, 'succes');
      }else{
        _flashMessage(_authController.message, 'error');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserAvatar();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          avatar==null?CircleAvatar(
            backgroundImage: _image == null?
            AssetImage("assets/images/logo.png")
            :FileImage(_image,),
          ):CircleAvatar(
            backgroundImage: NetworkImage(avatar)
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: getImage,
                child: SvgPicture.asset("assets/icons/Camera Icon.svg",color: Color(0xffa61019),),
              ),
            ),
          )
        ],
      ),
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
