// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.fields,
    this.nbResults,
    this.next,
    this.values,
    this.layerName,
    this.tableHref,
  });

  List<String> fields;
  int nbResults;
  String next;
  List<Value> values;
  String layerName;
  String tableHref;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        fields: List<String>.from(json["fields"].map((x) => x)),
        nbResults: json["nb_results"],
        next: json["next"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        layerName: json["layer_name"],
        tableHref: json["table_href"],
      );

  Map<String, dynamic> toJson() => {
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "nb_results": nbResults,
        "next": next,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "layer_name": layerName,
        "table_href": tableHref,
      };
}

class Value {
  Value({
    this.idtarretdestination,
    this.coursetheorique,
    this.direction,
    this.ligne,
    this.delaipassage,
    this.heurepassage,
    this.gid,
    this.lastUpdateFme,
    this.type,
    this.id,
  });

  int idtarretdestination;
  String coursetheorique;
  String direction;
  String ligne;
  String delaipassage;
  DateTime heurepassage;
  int gid;
  DateTime lastUpdateFme;
  Type type;
  int id;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        idtarretdestination: json["idtarretdestination"],
        coursetheorique: json["coursetheorique"],
        direction: json["direction"],
        ligne: json["ligne"],
        delaipassage: json["delaipassage"],
        heurepassage: DateTime.parse(json["heurepassage"]),
        gid: json["gid"],
        lastUpdateFme: DateTime.parse(json["last_update_fme"]),
        type: typeValues.map[json["type"]],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "idtarretdestination": idtarretdestination,
        "coursetheorique": coursetheorique,
        "direction": direction,
        "ligne": ligne,
        "delaipassage": delaipassage,
        "heurepassage": heurepassage.toIso8601String(),
        "gid": gid,
        "last_update_fme": lastUpdateFme.toIso8601String(),
        "type": typeValues.reverse[type],
        "id": id,
      };
}

enum Type { E, T }

final typeValues = EnumValues({"E": Type.E, "T": Type.T});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
