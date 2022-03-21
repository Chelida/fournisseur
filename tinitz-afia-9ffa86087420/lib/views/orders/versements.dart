
import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:le_fournisseur/models/Versement.dart';
import 'package:le_fournisseur/views/orders/show.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:le_fournisseur/models/Commande.dart';
import 'package:flutter/material.dart';

class VersementPage extends StatefulWidget {
  @override
  VersementPageState createState() => VersementPageState();
}

class VersementPageState extends State<VersementPage> {

  // CommandeController _commandeController = CommandeController();
  // var totalcredit;
  // var totaldebit;

  getData() async {
    // _commandeController.getVersement().whenComplete(() =>
    //     setState((){
    //       totalcredit = _commandeController.totalcredit;
    //       totaldebit = _commandeController.totaldebit;
    //     })

    // );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Mon relevé",
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
            Stack(
              children: <Widget>[
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 2.0, color: Colors.grey)
                      ]),
                  child: Row(
               
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Total débit ',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'totaldebit : 170009000FCFA',
                              style: TextStyle(
                                  color: Color(0xfff68a1f),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Total crédit',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'totalcredit : 0 FCFA',
                              style: TextStyle(
                                  color: Color(0xfff68a1f),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: VersementList()
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'Home');
      },
        backgroundColor:Color(0xffC71617),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }


  VersementList() {
    return FutureBuilder<List>(
      // future: _commandeController.getVersement(),
      builder: (context ,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new VersementItem()
            : new Center(child: new CircularProgressIndicator(),);
      },
    );
  }

}


class VersementItem extends StatelessWidget {

  // List<Versement> versements;
  // VersementItem({this.versements});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    // versements.length != 0?
     ListView.builder(
      //shrinkWrap: true,
        itemCount:  20,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Ref : versements[index].numero',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                                  textAlign: TextAlign.left,
                                ),
                                Row(
                                  children: [
                                    Text(' versements[index].moyen',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'versements[index].description',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',color: Color(0xff14427D)),
                                ),Text(
                                  'versements[index].type',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',color: Color(0xff14427D)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: [
                                          // if(versements[index].type == 'retrait')
                                            Text(
                                              'Débit : versements[index].montant FCFA',
                                              style: TextStyle(fontFamily: 'Montserrat',),
                                              textAlign: TextAlign.right,
                                            )
                                          // else
                                          //   Text(
                                          //     'Crédit : ${versements[index].montant} FCFA',
                                          //     textAlign: TextAlign.right,
                                          //     style: TextStyle(fontFamily: 'Montserrat',),
                                          //   ),
                                          // Text(
                                          //   'Solde : ${versements[index].solde} FCFA',
                                          //   textAlign: TextAlign.right,
                                          //   style: TextStyle(fontFamily: 'Montserrat',),
                                          // ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('effctuée par versements[index].created_by le versements[index].date_transaction.toString().replaceAll("T", " ").substring(0, 19)',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          );
        });Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Vous n'avez pas effectué de transaction ",
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
