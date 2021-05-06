import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:InfoApp/API/Horaire/services.dart' as serviceHR;
import 'package:InfoApp/API/Horaire/post.dart' as postHR;
import 'package:InfoApp/API/Alerte/Alert.dart' as postAL;
import 'package:InfoApp/API/Alerte/services.dart' as serviceAL;

class Tcl2 extends StatefulWidget {
  Tcl2({Key key, this.val}) : super(key: key);

  final val;

  @override
  _Tcl2State createState() => _Tcl2State();
}

class _Tcl2State extends State<Tcl2> {
  TextEditingController editingController = TextEditingController();
  postHR.Post posts;
  bool loading;
  final List<String> test = [];
  List<String> dummySearchListTime = List<String>();
  final List<String> duplicateItems = [];
  List<String> items = List<String>();
  List<String> item2 = List<String>();
  List<String> itemsTime = List<String>();
  List<String> valuesSearchTime = List<String>();
  var valueCount = 1000;
  List<String> defaultListData = List<String>();
  List<String> defaultListTime = List<String>();

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
        valueCount = 20;
      });
      return;
    } else {
      setState(() {
        itemsTime.clear();
        itemsTime.addAll(test);
        valueCount = 1000;
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
        items.addAll(defaultListData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    postHR.Post post = posts;
    var screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    if (screenSize.width > 1700) {
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
                          child: Animinfo(),
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
                                controller: editingController,
                                decoration: InputDecoration(
                                  labelText: "Search",
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  fillColor: Colors.yellow,
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
                              for (var i = 0; i < 1000; i++) {
                                duplicateItems.add(post.values[i].ligne +
                                    " - " +
                                    "En direction de : " +
                                    post.values[i].direction);
                                test.add(post.values[i].delaipassage);
                              }
                              items.addAll(duplicateItems);
                              itemsTime.addAll(test);
                              return ListTile(
                                title:
                                    //ICI VIENT LA LISTE TCL JSON
                                    Text(
                                  items[index],
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.grey.shade900),
                                  ),
                                ),
                                subtitle: Text(
                                  /*"Prochain passage dans : ~ "*/ "Filtre : " +
                                      itemsTime[index],
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
    } else if (screenSize.width > 1100) {
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              //ZONE BLEU + TCL LOGO//
              Container(
                width: 200,
                height: 2000,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://i.imgur.com/oHrpgDp.png",
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),

              //ZONE Yellow + TCL Search/Info defille //
              Container(
                width: 1080,
                color: Colors.amber.shade50,
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 600,
                          height: 70,
                          color: Colors.amber.shade50,
                          child: Animinfo(),
                        ),
                        Container(
                            width: 400,
                            height: 70,
                            color: Colors.grey,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 55.0,
                                    semanticLabel: 'Search Disable',
                                  ),
                                  Text(
                                    "   Rechercher une ligne ou une direction",
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 15,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
                      child: Container(
                        width: 1000,
                        height: 580,
                        color: Colors.amber.shade50,
                        child: ListView.separated(
                          itemCount: 10000,
                          separatorBuilder: (context, index) => Divider(
                            height: 50,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context, index) {
                            postHR.Post post = posts;
                            // var i = index / 2;
                            if (loading == false) {
                              return ListTile(
                                title:
                                    //ICI VIENT LA LISTE TCL JSON
                                    Text(
                                  post.values[index].ligne.toString() +
                                      " - " +
                                      "En direction de : " +
                                      post.values[index].direction.toString(),
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.grey.shade900),
                                  ),
                                ),
                                subtitle: Text(
                                  "Prochain passage dans : ~ " +
                                      post.values[index].delaipassage
                                          .toString(),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          child: Row(
            children: [
              //ZONE BLEU + TCL LOGO//
              Container(
                width: 200,
                height: 2000,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://i.imgur.com/oHrpgDp.png",
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),

              //ZONE Yellow + TCL Search/Info defille //
              Container(
                width: 824,
                color: Colors.amber.shade50,
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 430,
                          height: 70,
                          color: Colors.amber.shade50,
                          child: Animinfo(),
                        ),
                        Container(
                            width: 300,
                            height: 70,
                            color: Colors.grey,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 45.0,
                                    semanticLabel: 'Search Disable',
                                  ),
                                  Text(
                                    "  Rechercher une ligne ou une direction",
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 11,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
                      child: Container(
                        width: 800,
                        height: 448,
                        color: Colors.amber.shade50,
                        child: ListView.separated(
                          itemCount: 10000,
                          separatorBuilder: (context, index) => Divider(
                            height: 20,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.black26,
                          ),
                          itemBuilder: (context, index) {
                            postHR.Post post = posts;
                            // var i = index / 2;
                            if (loading == false) {
                              return ListTile(
                                title:
                                    //ICI VIENT LA LISTE TCL JSON
                                    Text(
                                  post.values[index].ligne.toString() +
                                      " - " +
                                      "En direction de : " +
                                      post.values[index].direction.toString(),
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey.shade900),
                                  ),
                                ),
                                subtitle: Text(
                                  "Prochain passage dans : ~ " +
                                      post.values[index].delaipassage
                                          .toString(),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
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

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Horaires théroqiue de la journée'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("5H30"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
