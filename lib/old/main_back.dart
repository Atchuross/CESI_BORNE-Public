import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Demo App',
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  var id = 1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]); //Force l'app a s'executer en mode paysage
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        width: 2000,
        height: 2000,
        color: HexColor("#131418"),
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 300,
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
            ],
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]); //Force l'app a s'executer en mode paysage
    SystemChrome.setEnabledSystemUIOverlays([]);

    void tryfunction(String url, int id) {
      if (id == 1) {
        debugPrint("L'url est : " + url);
      } else {
        debugPrint("Marche PAS !!!!!");
      }
    }
  }
}

class Web extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]); //Force l'app a s'executer en mode paysage
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: WebView(
        initialUrl: "https://google.com",
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
