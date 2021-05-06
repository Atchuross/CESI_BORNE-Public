import 'dart:async';

import 'package:flutter/material.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Maintenance",
            style: TextStyle(color: Colors.black, fontSize: 100),
          ),
        ],
      ),
    );
  }
}
