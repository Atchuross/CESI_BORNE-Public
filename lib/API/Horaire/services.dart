import 'package:http/http.dart' as http;
import 'dart:convert';

import 'post.dart';

class Services {
  static String url =
      'https://download.data.grandlyon.com/ws/rdata/tcl_sytral.tclpassagearret/all.json?maxfeatures=-1&start=1';
  static const String username = 'APIUSR';
  static const String password = 'APIPASS';
  static String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static Future<Post> getPosts() async {
    try {
      final response = await http
          .get(url, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        final Post listPosts = postFromJson(response.body);
        return listPosts;
      } else {
        return Post();
      }
    } catch (e) {
      return Post();
    }
  }
}
