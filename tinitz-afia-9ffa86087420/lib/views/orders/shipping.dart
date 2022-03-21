import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:le_fournisseur/views/orders/show.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:le_fournisseur/models/Commande.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingPage extends StatefulWidget {
  @override
  ShippingPageState createState() =>  ShippingPageState();
}

class  ShippingPageState extends State< ShippingPage> {

  // CommandeController _commandeController = CommandeController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Mes livraisons",
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold),
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
            Expanded(
                child: ShippingItems()
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'Home');
      },
        backgroundColor: Color(0xffC71617),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }


  // _shippingList() {
  //   return FutureBuilder<List>(
  //     // future: _commandeController.getLivraison(),
  //     builder: (context ,snapshot){
  //       if(snapshot.hasError) print(snapshot.error);
  //       return snapshot.hasData
  //           ? new ShippingItems()
  //           : new Center(child: new CircularProgressIndicator(),);
  //     },
  //   );
  // }

}


class ShippingItems extends StatelessWidget {

  // List<Commande> commandes;
  // ShippingItems({this.commandes});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    // commandes.length != 0? 
    ListView.builder(
      //shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsCommande(commandes[index])),
              );*/
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                            
                                children: <Widget>[
                                  Text(
                                    'Ref commande: FcE22',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ),
                                   SizedBox(height: 10,),
                                   Text(
                                    'Montant : 1000800FCFA',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',color: Color(0xffC71617)),
                                  ),
                                   SizedBox(height: 10,),
                                  Row(
                                   
                                    children: [
                                      Text('Etat : ',style: TextStyle(fontFamily: 'Montserrat',)),
                                      // commandes[index].etat==1?
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            'Payée',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Color(0xffC71617)),
                                        child: Center(
                                          child: Text(
                                            'Impayee',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Statut : ',style: TextStyle(fontFamily: 'Montserrat',)),
                                      // if(commandes[index].statut==1)
                                        Container(
                                          width: 80.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: Colors.green),
                                          child: Center(
                                            child: Text(
                                              'livrée',
                                              style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                            ),
                                          ),
                                        ),
                                      // if(commandes[index].statut==2)
                                        Container(
                                          width: 80.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: Color(0xffC71617)),
                                          child: Center(
                                            child: Text(
                                              'refusée',
                                              style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                            ),
                                          ),
                                        ),
                                      // if(commandes[index].statut==0)
                                        Container(
                                          width: 80.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: Colors.orange),
                                          child: Center(
                                            child: Text(
                                              'en attente ',
                                              style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: <Widget>[
                                 
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: <Widget>[
                          //             Expanded(
                          //               child: Column(
                          //                 children: [
                          //                   /*
                          //                   Text(
                          //                     'Avance : ${commandes[index].avance} FCFA',
                          //                     style: TextStyle(fontFamily: 'Montserrat',),
                          //                     textAlign: TextAlign.right,
                          //                   ),
                          //                   Text(
                          //                     'Reste : ${commandes[index].reste} FCFA',
                          //                     textAlign: TextAlign.right,
                          //                     style: TextStyle(fontFamily: 'Montserrat',),
                          //                   ),*/
                          //                 ],
                          //                 mainAxisAlignment: MainAxisAlignment.end,
                          //                 crossAxisAlignment: CrossAxisAlignment.end,
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        
                        
                        
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('Livrée  le 22-03-2012',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });Container(
              height: Get.height/6,
                               width: Get.width,
                               color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text("Vous n'avez pas de livraison ",
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
