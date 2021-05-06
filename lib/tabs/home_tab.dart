import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:InfoApp/widget/LaterNavBar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(
      children: [
        MyStatefulWidget(),
      ],
    );
  }
}
