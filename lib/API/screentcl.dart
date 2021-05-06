import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:InfoApp/API/Horaire/services.dart' as serviceHR;
import 'package:InfoApp/API/Horaire/post.dart' as postHR;
import 'package:InfoApp/API/Alerte/Alert.dart' as alertAL;
import 'package:InfoApp/API/Alerte/services.dart' as serviceAL;

class Tcl extends StatefulWidget {
  Tcl({Key key, this.val}) : super(key: key);

  final val;

  @override
  _TclState createState() => _TclState();
}

class _TclState extends State<Tcl> {
  TextEditingController editingController = TextEditingController();
  postHR.Post posts;
  alertAL.Alert alerts;
  bool loading;
  final List<String> test = [];
  List<String> dummySearchListTime = List<String>();
  final List<String> duplicateItems = [];
  List<String> items = List<String>();
  List<String> item2 = List<String>();
  List<String> itemsTime = List<String>();
  List<String> valuesSearchTime = List<String>();
  var valueCount = 12;
  List<String> defaultListData = List<String>();
  List<String> ligneData1 = List<String>();
  List<String> ligneData2 = List<String>();
  List<String> ligneData3 = List<String>();
  List<String> defaultListTime = List<String>();
  List<String> alertListCause = List<String>();
  List<String> alertListTitre = List<String>();
  List<String> alertListMessage = List<String>();
  List<String> alertListLigne = List<String>();

  @override
  void initState() {
    super.initState();
    loading = true;
    serviceHR.Services.getPosts().then((list) {
      setState(() {
        posts = list;
        loading = false;
      });
    });
    serviceAL.Services.getAlert().then((list) {
      setState(() {
        alerts = list;
      });
    });
  }

  void filterSearchResultsTime(String query) {
    List<String> dummySearchListTime = List<String>();
    dummySearchListTime.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListDataTime = List<String>();
      valuesSearchTime.forEach((element) {
        dummySearchListTime.forEach((itemsTime) {
          if (itemsTime.contains(query)) {
            dummyListDataTime.add(element);
          }
        });
      });

      setState(() {
        itemsTime.clear();
        itemsTime.addAll(dummyListDataTime);
        valueCount = 4;
      });
      return;
    } else {
      setState(() {
        itemsTime.clear();
        itemsTime.addAll(test);
        valueCount = 12;
      });
    }
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();

    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    postHR.Post post = posts;
    alertAL.Alert alert = alerts;
    if (loading == false) {
      for (var i = 0; i < 50; i++) {
        alertListCause.add("Information, " + alert.values[i].titre);
        alertListLigne.add(alert.values[i].ligneCom);
      }
      for (var i = 0; i < 50; i++) {
        alertListTitre.add(alert.values[1].cause);
      }
      for (var i = 0; i < 50; i++) {
        alertListMessage.add(
            "Consulter le site TCL pour plus de renseignements sur vos lignes");
      }

      for (var i = 0; i < 1000; i++) {
        duplicateItems.add(post.values[i].ligne +
            " - " +
            "En direction de : " +
            post.values[i].direction +
            " " +
            post.values[i].delaipassage);
        test.add(post.values[i].delaipassage);
      }

      items.forEach((item) {
        if (item.contains(alert.values[item.length].ligneCom)) {
          alertListLigne.add(item);
        }
      });

      if (alertListLigne.contains("C6")) {
        print("YESSSSSSSSSSSSS");
      } else {
        print("NOOOOOOOOOOOOOOOOOOO");
      }

      duplicateItems.forEach((item) {
        if (item.contains("C6C")) {
          ligneData1.add(item);
        }
      });

      duplicateItems.forEach((item) {
        if (item.contains("55B")) {
          ligneData2.add(item);
          //items.add(item);
        }
      });

      duplicateItems.forEach((item) {
        if (item.contains("34A")) {
          ligneData3.add(item);
          //items.add(item);
        }
      });

      for (var k = 0; k < 4; k++) {
        items.add(ligneData1[k]);
      }

      for (var k = 0; k < 4; k++) {
        items.add(ligneData2[k]);
      }

      for (var k = 0; k < 4; k++) {
        items.add(ligneData3[k]);
      }
    } else {
      return Container(
          width: 1200,
          height: 640,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitRipple(
                size: 100.0,
                color: Colors.red,
              )
            ],
          ));
    }

    var screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    if (screenSize.width > 1700) {
      alertAL.Alert alert = alerts;
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              //ZONE Yellow + TCL Search/Info defille //
              Container(
                width: 1386,
                color: Colors.amber.shade50,
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 800,
                          height: 70,
                          color: Colors.amber.shade50,
                          child: Container(
                            width: 800,
                            height: 70,
                            color: Colors.amber.shade50,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade900, width: 4)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TyperAnimatedTextKit(
                                        pause: Duration(milliseconds: 5000),
                                        text: [
                                          alertListCause[1],
                                          alertListTitre[1],
                                          alertListMessage[1],
                                        ],
                                        textStyle: GoogleFonts.getFont('Nunito',
                                            textStyle: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        Container(
                            width: 500,
                            height: 70,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 4)),
                              child: TextField(
                                onChanged: (value) {
                                  filterSearchResults(value.toUpperCase());
                                  filterSearchResultsTime(value.toUpperCase());
                                },
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade900),
                                controller: editingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Rechercher un ligne (Ex: C6C)",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 35,
                                  ),
                                  fillColor: Colors.amber.shade50,
                                  filled: true,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
                      child: Container(
                        width: 1200,
                        height: 640,
                        color: Colors.amber.shade50,
                        child: ListView.separated(
                          itemCount: valueCount,
                          separatorBuilder: (context, index) => Divider(
                            height: 50,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context, index) {
                            if (loading == false) {
                              if (alertListLigne.contains(items[index])) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index].substring(
                                                0, items[index].length - 6),
                                            style: GoogleFonts.getFont(
                                              'Quicksand',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                  color: Colors.grey.shade900),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebTcl()));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 20, 0),
                                            child: Icon(
                                              FontAwesomeIcons
                                                  .exclamationTriangle,
                                              color: Colors.orangeAccent,
                                              size: 30.0,
                                              semanticLabel: 'Horaire Modifié',
                                            ),
                                          )),
                                    ],
                                  ),
                                  //ICI VIENT LA LISTE TCL JSON
                                  subtitle: Text(
                                    "Prochain passage dans : " +
                                        items[index].substring(
                                            items[index].length - 6,
                                            items[index].length),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return ListTile(
                                  title:
                                      //ICI VIENT LA LISTE TCL JSON
                                      Text(
                                    items[index]
                                        .substring(0, items[index].length - 6),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Prochain passage dans : " +
                                        items[index].substring(
                                            items[index].length - 6,
                                            items[index].length),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return Container(
                                  width: 1200,
                                  height: 640,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SpinKitRipple(
                                        size: 100.0,
                                        color: Colors.red,
                                      )
                                    ],
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (screenSize.width > 1100) {
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              //ZONE Yellow + TCL Search/Info defille //
              Container(
                width: 1014,
                color: Colors.amber.shade50,
                padding: EdgeInsets.fromLTRB(50, 50, 110, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 500,
                          height: 70,
                          color: Colors.amber.shade50,
                          child: Animinfo(),
                        ),
                        Container(
                            width: 330,
                            height: 70,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
                              child: TextField(
                                onChanged: (value) {
                                  filterSearchResults(value.toUpperCase());
                                  filterSearchResultsTime(value.toUpperCase());
                                },
                                style: TextStyle(
                                    fontSize: 19, color: Colors.grey.shade900),
                                controller: editingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Rechercher un ligne (Ex: C6C)",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                  fillColor: Colors.amber.shade50,
                                  filled: true,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 80, 30, 50),
                      child: Container(
                        width: 1200,
                        height: 600,
                        color: Colors.amber.shade50,
                        child: ListView.separated(
                          itemCount: valueCount,
                          separatorBuilder: (context, index) => Divider(
                            height: 50,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context, index) {
                            if (loading == false) {
                              //items.addAll(defaultListData);
                              return ListTile(
                                title:
                                    //ICI VIENT LA LISTE TCL JSON
                                    Text(
                                  items[index]
                                      .substring(0, items[index].length - 6),
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.grey.shade900),
                                  ),
                                ),
                                subtitle: Text(
                                  "Prochain passage dans : " +
                                      items[index].substring(
                                          items[index].length - 6,
                                          items[index].length),
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                  width: 1200,
                                  height: 640,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SpinKitRipple(
                                        size: 100.0,
                                        color: Colors.red,
                                      )
                                    ],
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              //ZONE Yellow + TCL Search/Info defille //
              Container(
                width: 776,
                color: Colors.amber.shade50,
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 420,
                          height: 70,
                          color: Colors.amber.shade50,
                          child: Container(
                            width: 270,
                            height: 70,
                            color: Colors.amber.shade50,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade900, width: 2)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TyperAnimatedTextKit(
                                        pause: Duration(milliseconds: 5000),
                                        text: [
                                          alertListCause[1],
                                          alertListTitre[1],
                                          alertListMessage[1],
                                        ],
                                        textStyle: GoogleFonts.getFont('Nunito',
                                            textStyle: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        Container(
                            width: 290,
                            height: 70,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: TextField(
                                onChanged: (value) {
                                  filterSearchResults(value.toUpperCase());
                                  filterSearchResultsTime(value.toUpperCase());
                                },
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade900),
                                controller: editingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Rechercher un ligne (Ex: C6C)",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 25,
                                  ),
                                  fillColor: Colors.amber.shade50,
                                  filled: true,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                      child: Container(
                        width: 1200,
                        height: 498,
                        color: Colors.amber.shade50,
                        child: ListView.separated(
                          itemCount: valueCount,
                          separatorBuilder: (context, index) => Divider(
                            height: 50,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context, index) {
                            if (loading == false) {
                              if (alertListLigne.contains(items[index])) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index].substring(
                                                0, items[index].length - 6),
                                            style: GoogleFonts.getFont(
                                              'Quicksand',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                  color: Colors.grey.shade900),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebTcl()));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 20, 20, 0),
                                            child: Icon(
                                              FontAwesomeIcons
                                                  .exclamationTriangle,
                                              color: Colors.orangeAccent,
                                              size: 30.0,
                                              semanticLabel: 'Horaire Modifié',
                                            ),
                                          )),
                                    ],
                                  ),
                                  //ICI VIENT LA LISTE TCL JSON
                                  subtitle: Text(
                                    "Prochain passage dans : " +
                                        items[index].substring(
                                            items[index].length - 6,
                                            items[index].length),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return ListTile(
                                  title:
                                      //ICI VIENT LA LISTE TCL JSON
                                      Text(
                                    items[index]
                                        .substring(0, items[index].length - 6),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Prochain passage dans : " +
                                        items[index].substring(
                                            items[index].length - 6,
                                            items[index].length),
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return Container(
                                  width: 1200,
                                  height: 640,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SpinKitRipple(
                                        size: 100.0,
                                        color: Colors.red,
                                      )
                                    ],
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class Animinfo extends StatelessWidget {
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
          width: 800,
          height: 70,
          color: Colors.amber.shade50,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade900, width: 4)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TyperAnimatedTextKit(
                  pause: Duration(milliseconds: 5000),
                  text: [
                    "Information,",
                    "Ligne 86A : Pour cause de travaux",
                    "L'arret direction Gorge de loup et l'arret Avenue de la paix",
                    "sont reporté 50m en amont",
                    "Information,",
                    "Ligne C26 : Modification des horaires",
                    "A partir de 20h : un bus toutes les 35min",
                  ],
                  textStyle: GoogleFonts.getFont('Nunito',
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      )),
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
        ),
      );
    } else if (screenSize.width > 1100) {
      return Scaffold(
        body: Container(
          width: 600,
          height: 70,
          color: Colors.amber.shade50,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade900, width: 3)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TyperAnimatedTextKit(
                  pause: Duration(milliseconds: 5000),
                  text: [
                    "Information,",
                    "Ligne 86A : Pour cause de travaux",
                    "L'arret direction Gorge de loup et l'arret Avenue de la paix",
                    "sont reporté 50m en amont",
                    "Information,",
                    "Ligne C26 : Modification des horaires",
                    "A partir de 20h : un bus toutes les 35min",
                  ],
                  textStyle: GoogleFonts.getFont('Nunito',
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          width: 430,
          height: 70,
          color: Colors.amber.shade50,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade900, width: 2)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TyperAnimatedTextKit(
                  pause: Duration(milliseconds: 5000),
                  text: [
                    "Information,",
                    "Ligne 86A : Pour cause de travaux",
                    "L'arret direction Gorge de loup et l'arret Avenue de la paix",
                    "sont reporté 50m en amont",
                    "Information,",
                    "Ligne C26 : Modification des horaires",
                    "A partir de 20h : un bus toutes les 35min",
                  ],
                  textStyle: GoogleFonts.getFont('Nunito',
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
        ),
      );
    }
  }
}

class WebTcl extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.tcl.fr/se-deplacer/infos-trafic-accessibilite",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
