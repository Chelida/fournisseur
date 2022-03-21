import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:le_fournisseur/views/orders/show.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:le_fournisseur/models/Commande.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mes commandes",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC71617),
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            ),
            Expanded(child: Cmd()),
          ],
        ),
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
    );
  }

  // CommandesList() {
  //   return FutureBuilder<List>(

  //     builder: (context ,snapshot){
  //       if(snapshot.hasError) print(snapshot.error);
  //       return snapshot.hasData
  //           ? new Cmd()
  //           : new Center(child: new CircularProgressIndicator(),);
  //     },
  //   );
  // }

}

class Cmd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        //shrinkWrap: true,
        itemCount: 200,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: Get.height / 5,
                width: Get.width,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text(
                              'Ref : FC22',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Etat : ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    )),
                                // commandes[index].etat==1?
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.green),
                                  child: Center(
                                    child: Text(
                                      'Payée',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Color(0xffC71617)),
                                  child: Center(
                                    child: Text(
                                      'Impayee',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Statut : ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    )),
                                // if(commandes[index].statut==1)
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.green),
                                  child: Center(
                                    child: Text(
                                      'livrée',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                // if(commandes[index].statut==2)
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.orange),
                                  child: Center(
                                    child: Text(
                                      'encours',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                // if(commandes[index].statut==0)
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.grey),
                                  child: Center(
                                    child: Text(
                                      'en attente ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                // if(commandes[index].statut==3)
                                Container(
                                  width: 70.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Color(0xffC71617)),
                                  child: Center(
                                    child: Text(
                                      'refusée',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Montant TTC : 22FCFA',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Color(0xffC71617)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Enregistrée par commandes',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          );
        });
    //     Container(
    //     alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text("Vous n'avez pas de commande ",
    //             style:TextStyle(
    //                 fontSize: 18,
    //                 fontFamily: 'Montserrat',
    //                 color: Colors.grey,
    //                 fontWeight: FontWeight.bold
    //             )

    //         ),
    //         Padding(padding: EdgeInsets.all(2)),
    //       ],
    //     )
    // );
  }
}
