/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../screentcl.dart';
import '../web.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]); //Force l'app a s'executer en mode paysage
    SystemChrome.setEnabledSystemUIOverlays([]);
    var screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    if (screenSize.width > 1700) {
      return Scaffold(
        body: Container(
          width: 2000,
          height: 2000,
          color: HexColor("#131418"),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Web1()),
                        );
                      },
                      child: Container(
                        width: 400,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/header_pageActu_JPO.jpg',
                              height: 200,
                              width: 400,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Les Portes Ouvertes Digitales CESI sont de retour : RDV le 30 janvier 2021 !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web2()));
                      },
                      child: Container(
                        width: 400,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/cesilive.jpg',
                              height: 200,
                              width: 400,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Notre communication sur les JPO, CESI LIVE, reçoit un prix d’argent !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tcl()),
                        );
                      },
                      child: Container(
                        width: 400,
                        height: 350,
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              "https://i.imgur.com/oHrpgDp.png",
                              height: 300,
                              width: 400,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web3()));
                      },
                      child: Container(
                        width: 400,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/04/visuel_temoignage_continuite_pedagogique.jpg',
                              height: 200,
                              width: 400,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Tutorer à distance : un webinar pour échanger entre pairs !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web4()));
                      },
                      child: Container(
                        width: 400,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/Convention_Egalite.jpg',
                              height: 200,
                              width: 400,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "En Normandie, CESI renouvelle son engagement en faveur de l’égalité",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else if (screenSize.width > 1100) {
      return Scaffold(
        body: Container(
          width: 2000,
          height: 2000,
          color: HexColor("#131418"),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Web1()),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/header_pageActu_JPO.jpg',
                              height: 197,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Les Portes Ouvertes Digitales CESI sont de retour : RDV le 30 janvier 2021 !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web2()));
                      },
                      child: Container(
                        width: 350,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/cesilive.jpg',
                              height: 197,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Notre communication sur les JPO, CESI LIVE, reçoit un prix d’argent !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tcl()),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 250,
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              "https://i.imgur.com/oHrpgDp.png",
                              height: 197,
                              width: 250,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web3()));
                      },
                      child: Container(
                        width: 350,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/04/visuel_temoignage_continuite_pedagogique.jpg',
                              height: 197,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Tutorer à distance : un webinar pour échanger entre pairs !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web4()));
                      },
                      child: Container(
                        width: 350,
                        height: 250,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/Convention_Egalite.jpg',
                              height: 197,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "En Normandie, CESI renouvelle son engagement en faveur de l’égalité",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          width: 2000,
          height: 2000,
          color: HexColor("#131418"),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Web1()),
                        );
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/header_pageActu_JPO.jpg',
                              height: 150,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Les Portes Ouvertes Digitales CESI sont de retour : RDV le 30 janvier 2021 !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web2()));
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/cesilive.jpg',
                              height: 150,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Notre communication sur les JPO, CESI LIVE, reçoit un prix d’argent !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tcl()),
                        );
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              "https://i.imgur.com/oHrpgDp.png",
                              height: 200,
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web3()));
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/04/visuel_temoignage_continuite_pedagogique.jpg',
                              height: 150,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "Tutorer à distance : un webinar pour échanger entre pairs !",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Web4()));
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        color: HexColor("#ffc04d"),
                        child: Column(
                          children: [
                            Image.network(
                              'https://www.cesi.fr/wp-content/uploads/2020/12/Convention_Egalite.jpg',
                              height: 150,
                              width: 350,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    "En Normandie, CESI renouvelle son engagement en faveur de l’égalité",
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}*/
