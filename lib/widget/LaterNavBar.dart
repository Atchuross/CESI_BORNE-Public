import 'package:InfoApp/widget/Incident.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:InfoApp/API/screentcl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'Incident.dart';
import 'CesiInfo.dart';
import 'formbloc.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width > 1700) {
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: Colors.blueGrey.shade900,
              selectedIndex: _selectedIndex,
              groupAlignment: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Image.network(
                    "https://i.imgur.com/oHrpgDp.png",
                    width: 304,
                    height: 180,
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.grey.shade300,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  selectedIcon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.white,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.bug,
                    color: Colors.white,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
              ],
            ),
            // This is the main content.
            Expanded(
              child: Center(
                // ignore: missing_return
                child: Builder(builder: (BuildContext context) {
                  if (_selectedIndex == 0) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: Tcl(),
                    );
                  } else if (_selectedIndex == 1) {
                    return Container(
                      color: Colors.brown,
                      width: 1390,
                      height: 960,
                      child: WebView(
                        initialUrl: 'https://www.cesi.fr/medias/actualites/',
                      ),
                    );
                  } else if (_selectedIndex == 2) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: TestForm(),
                    );
                  }
                }),
              ),
            )
          ],
        ),
      );
    } else if (screenSize.width > 1100) {
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: Colors.blueGrey.shade900,
              selectedIndex: _selectedIndex,
              groupAlignment: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Image.network(
                    "https://i.imgur.com/oHrpgDp.png",
                    width: 304,
                    height: 180,
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.grey.shade300,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  selectedIcon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.white,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.bug,
                    color: Colors.white,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
              ],
            ),
            // This is the main content.
            Expanded(
              child: Center(
                // ignore: missing_return
                child: Builder(builder: (BuildContext context) {
                  if (_selectedIndex == 0) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: Tcl(),
                    );
                  } else if (_selectedIndex == 1) {
                    return Container(
                      color: Colors.brown,
                      width: 1390,
                      height: 960,
                      child: WebView(
                        initialUrl: 'https://www.cesi.fr/medias/actualites/',
                      ),
                    );
                  } else if (_selectedIndex == 2) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: TestForm(),
                    );
                  }
                }),
              ),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: Colors.blueGrey.shade900,
              selectedIndex: _selectedIndex,
              groupAlignment: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Image.network(
                    "https://i.imgur.com/oHrpgDp.png",
                    width: 230,
                    height: 140,
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.grey.shade300,
                    size: 150.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  selectedIcon: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.white,
                    size: 150.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    FontAwesomeIcons.bug,
                    color: Colors.white,
                    size: 190.0,
                    semanticLabel: 'Horaire Modifié',
                  ),
                  label: Text(''),
                ),
              ],
            ),
            // This is the main content.
            Expanded(
              child: Center(
                // ignore: missing_return
                child: Builder(builder: (BuildContext context) {
                  if (_selectedIndex == 0) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: Tcl(),
                    );
                  } else if (_selectedIndex == 1) {
                    return Container(
                      width: 1390,
                      height: 960,
                      child: WebView(
                        initialUrl: 'https://www.cesi.fr/medias/actualites/',
                      ),
                    );
                  } else if (_selectedIndex == 2) {
                    return Container(
                      color: Colors.amber.shade50,
                      width: 1390,
                      height: 960,
                      child: TestForm(),
                    );
                  }
                }),
              ),
            )
          ],
        ),
      );
    }
  }
}
