
import 'package:le_fournisseur/models/Notification.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:le_fournisseur/models/Notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // AuthController _authController = AuthController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mes notifications",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
      ),
      drawer: DrawerPage(),
      body: NotificationItem(),
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

  // _notif() {
  //   return FutureBuilder<List>(
  //     // future: _authController.getNotification(),
  //     builder: (context ,snapshot){
  //       if(snapshot.hasError) print(snapshot.error);
  //       return snapshot.hasData
  //           ? new NotificationItem()
  //           : new Center(child: new CircularProgressIndicator(),);
  //     },
  //   );
  // }
}

class NotificationItem extends StatelessWidget {

  // List<Notif> notifications;
  // NotificationItem({this.notifications});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    // notifications.length != 0?
     ListView.builder(
      //shrinkWrap: true,
        itemCount:  22,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("commande valide",style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
            ),
            subtitle: Text("Votre commande 589027 a ete valide ",style: TextStyle(
              fontFamily: 'Montserrat',
            ),),
            leading: SvgPicture.asset(
              "assets/icons/Bell.svg",
              color: Color(0xffFCC10A),
              width: 22,
            ),
            trailing: Text("15:15",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Montserrat',
              ),
            ),
          );
        });Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Vous n'avez pas de notification",
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
