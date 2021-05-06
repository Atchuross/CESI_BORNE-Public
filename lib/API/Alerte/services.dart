import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Alert.dart';

class Services {
  static const String url =
      'https://download.data.grandlyon.com/ws/rdata/tcl_sytral.tclalertetrafic_2/all.json?maxfeatures=-1&start=1';
  static const String username = 'APIUSR';
  static const String password = 'APIPASS';
  static String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static Future<Alert> getAlert() async {
    try {
      final response = await http
          .get(url, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        final Alert listPosts = alertFromJson(response.body);
        return listPosts;
      } else {
        return Alert();
      }
    } catch (e) {
      return Alert();
    }
  }
}
