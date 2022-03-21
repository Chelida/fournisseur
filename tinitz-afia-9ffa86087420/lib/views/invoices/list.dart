import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class FacturePage extends StatefulWidget {
  @override
  _FacturePageState createState() => _FacturePageState();
}

class _FacturePageState extends State<FacturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mes Factures",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      drawer: DrawerPage(),
      body: FactureItem(),
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

  _facture() {
    return FutureBuilder<List>(
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new FactureItem()
            : new Center(
                child: new CircularProgressIndicator(),
              );
      },
    );
  }
}

class FactureItem extends StatelessWidget {
  // List<Facture> factures;
  // FactureItem({this.factures});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        //shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 30.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // ListTile(
                            //   title: Text(
                            //     'factures 1',
                            //     style: TextStyle(
                            //         fontFamily: 'Montserrat',
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 15.0),
                            //   ),
                            //   leading: Column(
                            //     children: [
                            //       Text(
                            //         'Fc22',
                            //         style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey, fontSize: 12.0),
                            //       ),
                            //            Container(
                            //     width: 80.0,
                            //     height: 25.0,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20.0),
                            //         color: Color(0xffC71617)),
                            //     child: Center(
                            //       child: Text(
                            //         'Impayee',
                            //         style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                            //       ),
                            //     ),
                            //   ),

                            //     ],
                            //   ),
                            //   trailing:
                            //   //  factures[index].statut==1?
                            //   Column(
                            //     children: [
                            //       Container(
                            //         width: 80.0,
                            //         height: 25.0,
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(20.0),
                            //             color: Colors.green),
                            //         child: Center(
                            //           child: Text(
                            //             'Payee',
                            //             style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   )),

                            // Padding(
                            //   padding: const EdgeInsets.only(left: 12.0, right: 12.0,top: 10),
                            //   child:
                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Text(
                            //         "factures",
                            //         style: TextStyle(
                            //           fontFamily: 'Montserrat',
                            //           fontSize: 10.0,
                            //           fontWeight: FontWeight.bold
                            //       ),
                            //       ),
                            //       Column(
                            //         children: <Widget>[
                            //           Text(
                            //             "Avance :200047 FCFA",
                            //             style: TextStyle(
                            //                 fontFamily: 'Montserrat',
                            //                 color: Colors.grey,
                            //                 fontSize: 13.0,
                            //                 fontWeight: FontWeight.bold
                            //             ),
                            //           ),
                            //           Text(
                            //             "Reste :12002 FCFA",
                            //             style: TextStyle(
                            //                 fontFamily: 'Montserrat',
                            //                 color: Colors.grey,
                            //                 fontSize: 13.0,
                            //                 fontWeight: FontWeight.bold
                            //             ),
                            //           ),
                            //           Text(
                            //             "Montant Total :22000 FCFA",
                            //             style: TextStyle(
                            //               fontFamily: 'Montserrat',
                            //               color: Colors.black,
                            //               fontSize: 16.0,
                            //               fontWeight: FontWeight.bold),
                            //           ),

                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // ),

                            Container(
                              width: Get.width,
                              height: Get.height / 5.2,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'factures 1',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                         Text(
                                    'Reference facturen : Fc22',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.grey,
                                        fontSize: 12.0),
                                  ),
                                    ],
                                  ),
                               
                                    SizedBox(height: 10,),
                              
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Avance :200047 FCFA",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Reste :12002 FCFA",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Montant Total :22000 FCFA",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            'Payee',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 5.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xffC71617),
                        ),
                      )
                    ],
                  ),
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

    //         Text("Vous n'avez pas de facture",
    //             style:TextStyle(
    //                 fontSize: 18,
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
