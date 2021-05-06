import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Trywid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: 300,
        height: 300,
      ),
    );
  }
}
